class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :plate
      t.string :oil_type
      t.integer :oil_quantity

      t.timestamps
    end
  end
end
