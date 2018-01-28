class Exercise < ApplicationRecord
  has_many :exercise_images
  has_many :exercises_muscles
  has_many :muscles, through: :exercises_muscles
  has_and_belongs_to_many :sessions, uniq: true
  has_many :exercises_training_day
  has_many :training_days, through: :exercises_training_day

  validates :title_es, :title_en, presence: true

  has_field_localization(%w(title instructions))
end