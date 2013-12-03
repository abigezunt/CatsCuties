class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.text :ingredients
      t.decimal :unit_price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
