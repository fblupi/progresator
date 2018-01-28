class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :title_en
      t.string :title_es
      t.text :instructions_en
      t.text :instructions_es
      t.boolean :has_resting_time
      t.boolean :has_time
      t.boolean :has_repetitions
      t.boolean :has_weight
      t.boolean :has_speed

      t.timestamps
    end
  end
end
