class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :resting_times do |t|
      t.decimal :resting_time, precision: 5, scale: 2
      t.integer :goal_time
      t.integer :goal_repetitions
      t.decimal :goal_weight, precision: 5, scale: 2
      t.decimal :goal_speed, precision: 5, scale: 2
      t.integer :time
      t.integer :repetitions
      t.decimal :weight, precision: 5, scale: 2
      t.decimal :speed, precision: 5, scale: 2
      t.references :exercises_training_day

      t.timestamps
    end
  end
end
