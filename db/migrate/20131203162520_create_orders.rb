class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.boolean :paid, default: false
      t.datetime :order_date
      t.timestamps
    end
  end
end
