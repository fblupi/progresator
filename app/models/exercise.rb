class Exercise < ApplicationRecord
  has_many :exercises_muscles
  has_many :muscles, through: :exercises_muscles
  has_and_belongs_to_many :sessions, uniq: true

  validates :title_es, :title_en, presence: true

  has_field_localization(%w(title instructions))
end