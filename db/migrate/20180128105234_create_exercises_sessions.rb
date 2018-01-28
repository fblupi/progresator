class CreateExercisesSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises_sessions do |t|
      t.references :exercise
      t.references :session

      t.timestamps
    end
  end
end
