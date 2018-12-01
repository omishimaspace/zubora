class Step < ApplicationRecord
  belongs_to :recipe
  has_many :photos, as: :photoable, dependent: :destroy
end
