class AddTimestampToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :cancelled_at, :datetime
  end
end
