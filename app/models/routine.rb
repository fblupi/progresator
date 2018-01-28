class Routine < ApplicationRecord
  has_many :sessions
  has_many :routines_users
  has_many :users, through: :routines_users
  has_one :user # author

  validates :name_es, :name_en, :user, presence: true

  has_field_localization(%w(name description))
end