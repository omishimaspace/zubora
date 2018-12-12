class Api::V1::RecipesController < Api::V1::ApplicationController
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: { status: 201 }, status: 201
    else
      render json: { status: 400 }, sttaus: 400
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :elapsed_minutes, :description, :category_id, :score, foods_attributes:[:id, :name], steps_attributes: [:id, :description], kitchenwares_attributes: [:id, :name])
    end
end
