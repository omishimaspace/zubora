class Api::V1::ChefsController < ApplicationController
  def index
    pp chef_params
    category_id = Category.find_by(name: chef_params[:category])&.id

    query = {ingredients_food_name_cont_any: chef_params[:food]&.split(','),
             category_id_eq: category_id,
             elapsed_minutes_lteq: chef_params[:times]
    }
    results = Recipe.ransack(query).result.limit(3)
    render json: { recipes: results }
  end


  private

  def chef_params
    params.permit(:category, :food, :times)
  end
end
