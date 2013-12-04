class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
  	@products = Product.order("updated_at DESC")
  end

  def about
  end

  def contact
  end

  def check_out
  	Order.create(session[:cart_id])
  end

end
