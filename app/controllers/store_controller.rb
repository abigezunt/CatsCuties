class StoreController < ApplicationController
  def index
  	@products = Product.all
  end

  def about
  end

  def contact
  end

  def check_out
  	Order.create(session[:cart_id])
  end

end
