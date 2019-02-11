class AddAuthForMechanics < ActiveRecord::Migration[5.2]
  def change
    add_column :mechanics, :password, :string
  end
end
