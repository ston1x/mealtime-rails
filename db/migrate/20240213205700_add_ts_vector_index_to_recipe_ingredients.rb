class AddTsVectorIndexToRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    add_index :recipes, "to_tsvector('#{Recipe::FULL_TEXT_SEARCH_CONFIGURATION}', ingredients)", using: :gin, name: 'tsvector_ingredients_idx'
  end
end
