class ExerciseImage < ApplicationRecord
  belongs_to :exercise

  has_attached_file :image, styles: { large: 'x1024', medium: 'x512', thumb: 'x128' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end