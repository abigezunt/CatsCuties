class OrdersController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:new, :create]
	before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
  	@orders = Order.all
  end



  def new
  	if @cart.line_items.empty?
  		redirect_to store_url, notice: "Your cart is empty."
  	else
  	  @order = Order.new
      @amount = @cart.total_price
    end 
  end

  def create

    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    # Amount in cents
    @amount = (@cart.total_price * 100).to_i
    customer = Stripe::Customer.create(
      email: @order.email,
      card: params[:stripeToken]
    )

    stripe_order = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
    # rescue Stripe::CardError => e
    #   flash[:error] = e.message

    if @order.errors.empty?
      @order.paid = true
    end

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        OrderNotifier.order_created(@order).deliver
        format.html { redirect_to store_url, notice: 'Thank you for your order.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        if @order.ship_date
          OrderNotifier.shipped(@order).deliver
        end
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :name, :address, :email, :charity)
    end

end
