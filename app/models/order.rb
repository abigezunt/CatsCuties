class Order < ActiveRecord::Base
	has_many :line_items
	validates :total_price, numericality: true
end
