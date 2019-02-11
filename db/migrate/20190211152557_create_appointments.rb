class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :location
      t.integer :odometer
      t.integer :mechanic_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
