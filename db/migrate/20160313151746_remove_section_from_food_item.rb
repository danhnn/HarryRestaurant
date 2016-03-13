class RemoveSectionFromFoodItem < ActiveRecord::Migration
  def change
    remove_column :food_items, :section, :string
  end
end
