module Recipes
  class Searcher
    # Specify how many additional ingredients (that weren't specified) to allow in recipes.
    # This means we suppose that the user might have some of the additional ingredients at home.
    ADDITIONAL_INGREDIENTS_OFFSET_RATIO = 0.1
    # Minimum score for a recipe to be considered a match. Needed to be relatively low for when
    # there's a big difference in amount of ingredients
    RANK_SCORE_THRESHOLD = 0.025

    def initialize(ingredients:)
      @ingredients = ingredients
    end

    def call
      search
    end

    private

    # rubocop:disable Metrics/MethodLength
    def search
      Recipe.find_by_sql(
        [
          sql_query,
          Recipe::FULL_TEXT_SEARCH_CONFIGURATION,
          Recipe::FULL_TEXT_SEARCH_CONFIGURATION,
          @ingredients.map { |ingredient| "'#{ingredient}'" }.join(' | '),
          Recipe::FULL_TEXT_SEARCH_CONFIGURATION,
          Recipe::FULL_TEXT_SEARCH_CONFIGURATION,
          @ingredients.map { |ingredient| "'#{ingredient}'" }.join(' | '),
          RANK_SCORE_THRESHOLD
        ]
      ).select { |recipe| recipe.ingredients.size <= max_appropriate_ingredients_amount }
    end
    # rubocop:enable Metrics/MethodLength

    # Using Full Text Search functionality of PostgreSQL. See docs for more details: https://www.postgresql.org/docs/16/textsearch.html
    def sql_query
      <<~SQL
          SELECT *
          FROM (
            SELECT *,
                   ts_rank(to_tsvector(?, ingredients), to_tsquery(?, ?)) AS score
          FROM recipes
          WHERE to_tsvector(?, ingredients) @@ to_tsquery(?, ?)
        ) AS subquery
        WHERE score > ?
        ORDER by score DESC;
      SQL
    end

    def max_appropriate_ingredients_amount
      @max_appropriate_ingredients_amount ||= (
        @ingredients.size + (@ingredients.size * ADDITIONAL_INGREDIENTS_OFFSET_RATIO)
      ).to_i
    end
  end
end
