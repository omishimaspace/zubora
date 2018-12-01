class Api::V1::ChefsController < ApplicationController
  def index
    pp chef_params
    Recipe.joins(ingredients: :food).where(feel: 1, elapsed_minutes: 10).where(food: { name: '大根' })
    render json: {recipes: Recipe.all}
  end


  private

  def chef_params
    params.permit(:feel, :food, :times)
  end
end
