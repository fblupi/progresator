class Session < ApplicationRecord
  has_and_belongs_to_many :exercises, uniq: true

  has_field_localization(%w(name description))
end