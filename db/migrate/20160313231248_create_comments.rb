class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :food_item, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.integer :rating

      t.timestamps null: false
    end
  end
end
