class OrdersController < ApplicationController
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end
end
