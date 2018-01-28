class CreateMuscles < ActiveRecord::Migration[5.1]
  def change
    create_table :muscles do |t|
      t.string :name_en
      t.string :name_es

      t.timestamps
    end
  end
end
