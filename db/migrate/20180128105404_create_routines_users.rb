class CreateRoutinesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :routines_users do |t|
      t.references :routine
      t.references :user
      t.references :progression

      t.timestamps
    end
  end
end
