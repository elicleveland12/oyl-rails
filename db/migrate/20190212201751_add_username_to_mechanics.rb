class AddUsernameToMechanics < ActiveRecord::Migration[5.2]
  def change
    add_column :mechanics, :username, :string
  end
end
