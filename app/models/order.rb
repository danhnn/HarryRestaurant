class Order < ActiveRecord::Base
  belongs_to :food_item
end
