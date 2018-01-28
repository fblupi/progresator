class Serie < ApplicationRecord
  belongs_to :exercises_training_day

  validates :resting_time, presence: true
  validate :check_goal_attrs_presence

  def exercise
    exercises_training_day.exercise
  end

  def completed?
    time_completed? && repetitions_completed? && weight_completed? && speed_completed?
  end

  def achieved?
    time_achieved? && repetitions_achieved? && weight_achieved? && speed_achieved?
  end

  private

  def check_goal_attrs_presence
    errors.add('goal time cannot be blank') if self.exercises_training_day.exercise.has_time? && self.goal_time.nil?
    errors.add('goal repetitions cannot be blank') if self.exercises_training_day.exercise.has_repetitions? && self.goal_repetitions.nil?
    errors.add('goal weight cannot be blank') if self.exercises_training_day.exercise.has_weight? && self.goal_weight.nil?
    errors.add('goal speed cannot be blank') if self.exercises_training_day.exercise.has_speed? && self.goal_speed.nil?
  end

  def time_completed?
    !exercise.has_time? || !time.nil?
  end

  def repetitions_completed?
    !exercise.has_repetitions? || !repetitions.nil?
  end

  def weight_completed?
    !exercise.has_weight? || !weight.nil?
  end

  def speed_completed?
    !exercise.has_speed? || !speed.nil?
  end

  def time_achieved?
    time_completed && time >= goal_time
  end

  def repetitions_achieved?
    repetitions_completed && repetitions >= goal_repetitions
  end

  def weight_achieved?
    weight_completed && weight >= goal_weight
  end

  def speed_achieved?
    speed_completed && speed >= goal_speed
  end
end