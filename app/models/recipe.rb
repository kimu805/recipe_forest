class Recipe < ApplicationRecord
  # association
  belongs_to :user

  # validation
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 50 }
  with_options length: { maximum: 1000 } do
    validates :description
    validates :ingredients
    validates :steps
  end
  validates :cooking_time,
    numericality: { only_integer: true }
end
