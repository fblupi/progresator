class CreateExerciseImages < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_images do |t|
      t.attachment :image
      t.references :exercise

      t.timestamps
    end
  end
end
