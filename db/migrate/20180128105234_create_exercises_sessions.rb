class CreateExercisesSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises_sessions do |t|
      t.references :exercise
      t.references :session

      t.timestamps
    end

    add_index :exercises_sessions, [:exercise_id, :session_id], unique: true
  end
end
