class RoutinesUser < ApplicationRecord
  belongs_to :routine
  belongs_to :user
  has_one :progression
  has_many :training_days

  validates :name_es, :name_en, :routine, :user, presence: true
  validates_uniqueness_of :routine, user: :muscle

  has_field_localization(%w(name description))

  def sessions
    routine.sessions
  end
end