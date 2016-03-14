class AddCouponCodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :coupon_code, :string
  end
end
