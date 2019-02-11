class CreateMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :experience
      t.string :locaiton
      t.integer :range

      t.timestamps
    end
  end
end
