class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	delegate :name, to: :product, prefix: true

	def total_price
		product.unit_price * quantity
	end
	
end
