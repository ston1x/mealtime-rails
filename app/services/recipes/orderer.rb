module Recipes
  class Orderer
    # Amount of most matching recipes to be returned
    RECIPES_BUFFER_FOR_ALTERNATIVE_ORDERING = 50

    def initialize(recipes:, order_by:)
      @recipes = recipes
      @order_by = order_by
    end

    def call
      case @order_by
      when 'ratings'
        sliced_buffer_of_recipes.sort_by { |recipe| -recipe.ratings }
      when 'ingredients'
        sliced_buffer_of_recipes.sort_by { |recipe| -recipe.ingredients.count }
      else
        sliced_buffer_of_recipes
      end
    end

    private

    def sliced_buffer_of_recipes
      @sliced_buffer_of_recipes ||= @recipes.first(RECIPES_BUFFER_FOR_ALTERNATIVE_ORDERING)
    end
  end
end
