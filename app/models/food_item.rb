class FoodItem < ActiveRecord::Base
	def image_url_or_default
		if image_url.present?
			image_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end

	def self.by_section(section)
		where(section: section)
	end
end
