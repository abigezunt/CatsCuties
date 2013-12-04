class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.text :name
      t.text :address
      t.text :email
      t.text :charity
      t.boolean :paid, default: false
      t.boolean :shipped, default: false
      t.datetime :order_date
      t.timestamps
    end
  end
end
