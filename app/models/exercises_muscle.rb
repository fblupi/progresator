class ExercisesMuscle < ApplicationRecord
  belongs_to :exercise
  belongs_to :muscle

  validates :intensity, presence: true
  validates_uniqueness_of :exercise, scope: :muscle
end