class CreateProgressions < ActiveRecord::Migration[5.1]
  def change
    create_table :progressions do |t|
      t.string :type

      t.timestamps
    end
  end
end
