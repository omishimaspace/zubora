class Api::V1::ChefsController < ApplicationController
  def index
    category_id = Category.find_by(name: chef_params[:category])&.id

    query = {ingredients_food_name_cont_any: chef_params[:food]&.split(','),
             category_id_eq: category_id,
             elapsed_minutes_lteq: chef_params[:times]
    }
    render json: { recipes:  Recipe.ransack(query).result.score_order }
  end


  private

  def chef_params
    params.permit(:category, :food, :times)
  end
end
