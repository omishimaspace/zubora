class Food < ApplicationRecord
  has_many :ingredients, dependent: :destroy
end
