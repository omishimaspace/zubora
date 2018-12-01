class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :recipe_kitchenwares, dependent: :destroy
  has_many :kitchenwares, through: :recipe_kitchenwares

  accepts_nested_attributes_for :foods
  accepts_nested_attributes_for :steps
  accepts_nested_attributes_for :kitchenwares

  validates :name, presence: true
  validates :elapsed_minutes, presence: true, numericality: true, inclusion: { in: 0..999 }
  has_many :photos, as: :photoable, dependent: :destroy
  belongs_to :category

  scope :elapsed_minutes, ->(elapsed_minutes) { elapsed_minutes.present? ? where(elapsed_minutes: elapsed_minutes) : Recipe.none }
end
