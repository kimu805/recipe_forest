class Recipe < ApplicationRecord
  # association
  belongs_to :user
  has_one_attached :image

  # validation
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 50, allow_blank: true }
  with_options length: { maximum: 1000 }, presence: true do
    validates :description
    validates :ingredients
    validates :steps
  end
  validates :cooking_time,
    presence: true,
    numericality: { only_integer: true, allow_blank: true }
end
