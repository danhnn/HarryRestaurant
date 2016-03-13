class AddQuantityToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :quantity, :integer
  end
end
