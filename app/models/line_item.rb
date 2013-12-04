class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	validates :quantity, :numericality => {:greater_than_or_equal_to => 0}
	delegate :name, :description, :unit_price, :image_url, to: :product, prefix: true

	def total_price
		product.unit_price * quantity
	end
	
end
