class CreateExercisesMuscles < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises_muscles do |t|
      t.references :exercise
      t.references :muscle
      t.integer :intensity

      t.timestamps
    end
  end
end
