class Muscle < ApplicationRecord
  validates :name_es, :name_en, presence: true

  has_field_localization(%w(name))
end