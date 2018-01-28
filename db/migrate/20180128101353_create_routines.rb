class CreateRoutines < ActiveRecord::Migration[5.1]
  def change
    create_table :routines do |t|
      t.string :name_en
      t.string :name_es
      t.text :description_en
      t.text :description_es
      t.references :user

      t.timestamps
    end
  end
end
