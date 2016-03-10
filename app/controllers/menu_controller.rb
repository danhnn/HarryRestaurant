class MenuController < ApplicationController
  def index
  	@sections = %w(Breakfast Lunch Dinner Supper)
  	@food_items = FoodItem.by_section(params[:section])
  end
end
