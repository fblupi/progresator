class Exercise < ApplicationRecord
  has_many :exercises_muscles
  has_many :muscles, through: :exercises_muscles

  validates :title_es, :title_en, presence: true

  has_field_localization(%w(title instructions))
end