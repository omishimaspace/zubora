class RecipeKitchenware < ApplicationRecord
  belongs_to :recipe
  belongs_to :kitchenware
end
