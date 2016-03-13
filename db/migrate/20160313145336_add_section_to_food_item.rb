class AddSectionToFoodItem < ActiveRecord::Migration
  def change
    add_reference :food_items, :section, index: true, foreign_key: true
  end
end
