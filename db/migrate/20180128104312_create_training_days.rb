class CreateTrainingDays < ActiveRecord::Migration[5.1]
  def change
    create_table :training_days do |t|
      t.date :day
      t.references :progression
      t.references :routines_user
      t.references :session

      t.timestamps
    end
  end
end
