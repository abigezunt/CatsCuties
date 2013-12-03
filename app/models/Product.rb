class Product < ActiveRecord::Base
	# has_attached_file :image, :styles =>{ :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :title, :description, :ingredients, presence: true
  validates :title, uniqueness: true
  validates :unit_price, :numericality => {:greater_than_or_equal_to => 0.01}
end
