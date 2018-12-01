class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :recipe_kitchenwares, dependent: :destroy
  has_many :kitchenwares, through: :recipe_kitchenwares

  scope :elapsed_minutes, ->(elapsed_minutes) { elapsed_minutes.present? ? where(elapsed_minutes: elapsed_minutes) : Recipe.none }
end
