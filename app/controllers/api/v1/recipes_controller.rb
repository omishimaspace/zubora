class Api::V1::RecipesController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render status: 200, json: { status: 200 }
    else
      render status: 500, json: { status: 500 }
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :elapsed_minutes, :description, :score, foods_attributes:[:id, :name], steps_attributes: [:id, :description], kitchenwares_attributes: [:id, :name])
    end
end
