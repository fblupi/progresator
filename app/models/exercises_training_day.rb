class ExercisesTrainingDay < ApplicationRecord
  belongs_to :exercise
  belongs_to :training_day
  has_many :series

  def num_series
    series.count
  end

  def num_series_completed
    series.where(&:completed?).count
  end

  def num_series_achieved
    series.where(&:achieved?).count
  end
end