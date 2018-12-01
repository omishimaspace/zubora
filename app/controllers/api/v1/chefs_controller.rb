class Api::V1::ChefsController < ApplicationController
  def index

    render json: {recipes: []}
  end
end
