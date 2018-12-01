class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :recipe_kitchenwares, dependent: :destroy
  has_many :kitchenwares, through: :recipe_kitchenwares
  belongs_to :category

  scope :elapsed_minutes, ->(elapsed_minutes) { elapsed_minutes.present? ? where(elapsed_minutes: elapsed_minutes) : Recipe.none }
end
