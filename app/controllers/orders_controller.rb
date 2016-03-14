class OrdersController < ApplicationController
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end

	def create
		@food_item = FoodItem.find params[:food_item_id]

		@order = Order.new(order_params)
		@order.food_item = @food_item
		
		if @order.save
			respond_to do |format|
				order_finish_url = get_order_url @order.id
				UserMailer.welcome_email(@order,order_finish_url).deliver_later	
				@order.send_message(@order.phone,"You have ordered #{@order.quantity} #{@food_item.name} from Harry Nguyen Restaurant! Thank you!")

				format.html { redirect_to food_item_order_path(id: @order.id), notice: 'Order item was successfully created.' }
				format.json { render :show, status: :created, location: food_item_order_path(id: @order.id) }
			end
		else
			flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
			render 'new'
		end
		
	end

	def show
		@food_item = FoodItem.find params[:food_item_id]
		@order = Order.find params[:id]

		calculate_order_value()
		flash[:success] = "Order submitted. Thank you!"
	end


	def done

	end

	private
	def order_params
		params.require(:order).permit(:name,:phone,:address,:email,:quantity,:coupon_code)
	end

	def calculate_order_value
		@delevery_fee = 20000
		@food_fee = @food_item.price * @order.quantity
		@total = @delevery_fee + @food_fee

		if @order.coupon_code == "CODERSCHOOL"
			@total = @total * 0.5
			@isDiscount = true
		end
	end

	def get_order_url(order_id)
		value = url_for :controller => 'orders', :action => 'show', :id => order_id
	end
end
