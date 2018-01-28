class CreateExercisesTrainingDays < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises_training_days do |t|
      t.references :exercise
      t.references :training_day

      t.timestamps
    end
  end
end
