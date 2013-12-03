class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.integer :product_id
      t.decimal :total, :precision => 8, :scale => 2
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
    end
  end
end
