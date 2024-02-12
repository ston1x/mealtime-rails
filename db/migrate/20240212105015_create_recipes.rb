class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :cook_time, null: false
      t.integer :prep_time, null: false
      t.text :ingredients, null: false
      t.decimal :ratings, null: false
      t.string :category
      t.string :author
      t.text :image, null: false

      t.timestamps
    end
  end
end
