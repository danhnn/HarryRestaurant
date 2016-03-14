# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FoodNames = [
	'Phở gà','Phở bò','Hủ tiếu','Bò kho','Bánh tráng trộn','Chè','Sinh tố','Sữa chua','Trái cây dầm',
	'Bắp rang','Bánh mì','Xôi','Dưa hấu','Đậu phộng','Nước dừa','Há cảo','Bạch tuộc nướng',
	'Nước mắm','Mì Ý','Cơm chiên dương châu'
]

Section.destroy_all

all = Section.create(name: 'All')
breakfast = Section.create(name: 'Breakfast')
lunch = Section.create(name: 'Lunch')
dinner = Section.create(name: 'Dinner')
drinks = Section.create(name: 'Drinks')

section_id = 0

FoodNames.each.with_index do |value, index|
	if index < 5 
		section_id = breakfast.id
	elsif index < 10 
		section_id = lunch.id
	elsif index < 15 
		section_id = dinner.id
	else
		section_id = drinks.id
	end


	FoodItem.create(name: value,
		description: Faker::Lorem.paragraph(5),
		price: Faker::Commerce.price,
		section_id: section_id,
		views: 0,
		image_url: '')
end

FoodItem.all.each do |food|
  food.comments.create(rating: Faker::Number.between(1, 5), title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(2))
  food.comments.create(rating: Faker::Number.between(1, 5), title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(2))
end