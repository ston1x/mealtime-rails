class Api::V1::RecipesController < Api::BaseController
  def index
    recipes = Recipes::Provider.new(**search_params).call

    render json: recipes
  end

  private

  def search_params
    params.permit(:order_by, ingredients: []).to_h.symbolize_keys
  end
end
