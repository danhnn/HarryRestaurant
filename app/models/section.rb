class Section < ActiveRecord::Base
	has_many :food_items, dependent: :destroy

	def self.getSection(section_id)
		if section_id == "-1"
			where(name: 'All').first
		else
			where(id: section_id).first
		end
	end
end
