class Product < ActiveRecord::Base
	# has_attached_file :image, :styles =>{ :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :name, :description, :ingredients, presence: true
  validates :name, uniqueness: true
  validates :unit_price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, allow_blank: true, format:  {
  	with: %r{\.(gif|jpg|png)\Z}i,
  	message: 'must be a URL for GIF, JPG, or PNG image.'
  }
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  def self.latest
  	Product.order(:updated_at).last 
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
