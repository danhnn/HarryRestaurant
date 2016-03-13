class FoodItem < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	belongs_to :section
	def image_url_or_default
		if image_url.present?
			image_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end

	def self.by_section(section,order_by)
		food_items = nil	
		if section.name == 'All' 
			food_items = FoodItem.all
		else
			food_items = where(section_id: section.id)
		end

		food_items.order(order_by)
	end

end

