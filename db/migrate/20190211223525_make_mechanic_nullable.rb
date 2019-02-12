class MakeMechanicNullable < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :mechanic_id, :integer, :null => true
  end
end
