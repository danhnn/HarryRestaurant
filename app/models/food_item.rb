class FoodItem < ActiveRecord::Base
	paginates_per 5
	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :section
	
	def image_url_or_default
		if image_url.present?
			image_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end

	def self.by_section(section,order_by,page)
		food_items = nil	
		if section.name == 'All' 
			food_items = FoodItem.all
		else
			food_items = where(section_id: section.id)
		end

		food_items.order(order_by).page page
	end

	def show_rating
		value = comments.size == 0 ? 0 : (comments.sum(:rating) / comments.size).round(3)
	end
end

