class TrainingDay < ApplicationRecord
  has_one :session
  has_one :progression
  belongs_to :routines_user
  has_many :exercises_training_days
  has_many :exercises, through: :exercises_training_days

  validates :day, :progression, :routine_user, :session, presence: true
  validate :check_session

  before_validation :set_progression_from_routine, on: :create

  def num_exercises
    exercises_training_days.count
  end

  def num_exercises_completed
    exercises_training_days.where { |e| e.num_series_completed == e.num_series }.count
  end

  def num_exercises_achieved
    exercises_training_days.where { |e| e.num_series_achieved == e.num_series }.count
  end

  private

  def set_progression_from_routine
    self.progression = self.routines_user.progression
  end

  def check_session
    errors.add('session must be a session of its routine') unless self.routines_user.sessions.include? self.session
  end
end