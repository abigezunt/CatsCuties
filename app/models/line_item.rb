class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	validates :quantity, :numericality => {:greater_than_or_equal_to => 1}
	delegate :name, :description, :unit_price, :image_url, to: :product, prefix: true
  before_update :delete_if_invalid_quantity

	def total_price
		product.unit_price * quantity
	end

  protected
  def delete_if_invalid_quantity
   if self.quantity <= 0
     self.destroy
   end
  end
	
end
