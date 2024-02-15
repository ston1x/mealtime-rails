module Recipes
  class Provider
    def initialize(ingredients:, order_by:)
      @ingredients = ingredients
      @order_by = order_by
    end

    attr_reader :ingredients, :order_by, :search_results

    def call
      search
      order
    end

    private

    def search
      @search_results = Searcher.new(ingredients:).call
    end

    def order
      Orderer.new(recipes: @search_results, order_by:).call
    end
  end
end
