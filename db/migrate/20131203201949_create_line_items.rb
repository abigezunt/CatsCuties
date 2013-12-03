class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :total, :precision => 8, :scale => 2
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
