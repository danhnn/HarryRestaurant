class CommentsController < ApplicationController
	def create
		@food_item = FoodItem.find params[:food_item_id]

		@commnet = Comment.new(comment_params)
		@commnet.food_item = @food_item
		@aaa = comment_params
	
		if @commnet.save
			flash[:success] = "Comment submitted. Thank you!"
			redirect_to food_item_path(@food_item)
		else
			flash[:error] = "Error: #{@commnet.errors.full_messages.to_sentence}"
			redirect_to food_item_path(@food_item)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:rating,:title,:body)
	end
end
