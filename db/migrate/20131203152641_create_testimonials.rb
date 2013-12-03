class CreateTestimonials < ActiveRecord::Migration
  def change
  	create_table :testimonials do |t|
      t.text :name
      t.text :quote
      t.text :comment
      t.timestamps
    end
  end
end
