class AddViewsToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :views, :integer
  end
end
