class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	delegate :name, to: :product, prefix: true
end
