class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :elapsed_minutes, :score, :description, :photo_url, :url

  def url
    Rails.application.routes.url_helpers.recipe_url(object)
  end

  def photo_url
    object.photos.first&.url
  end
end
