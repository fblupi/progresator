class Muscle < ApplicationRecord
  has_many :exercises_muscles
  has_many :exercises, through: :exercises_muscles

  validates :name_es, :name_en, presence: true

  has_field_localization(%w(name))
end