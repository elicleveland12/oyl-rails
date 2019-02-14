class AddImageToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :image, :string
  end
end
