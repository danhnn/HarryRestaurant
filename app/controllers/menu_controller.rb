class MenuController < ApplicationController
  def index
  	@sections = Section.all
  	@section = Section.getSection params[:section_id]
  	@food_items = FoodItem.by_section(@section,params[:order],params[:page])
  end
end
