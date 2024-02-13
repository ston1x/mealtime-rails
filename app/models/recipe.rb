class Recipe < ApplicationRecord
  # Make sure to re-run the AddTsVectorIndexToRecipeIngredients migration when changing this
  FULL_TEXT_SEARCH_CONFIGURATION = 'english'.freeze # Language configuration for normalizing words into lexemes

  validates :title, presence: true
  validates :cook_time, presence: true
  validates :prep_time, presence: true
  validates :ingredients, presence: true
  validates :ratings, presence: true
  validates :image, presence: true
end
