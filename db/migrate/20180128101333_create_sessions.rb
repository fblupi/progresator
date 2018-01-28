class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :name_en
      t.string :name_es
      t.text :description_en
      t.text :description_es
      t.references :routine

      t.timestamps
    end
  end
end
