class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name_on_card
      t.string :card_number
      t.string :expiration
      t.integer :security_code
      t.integer :user_id
      t.integer :mechanic_id

      t.timestamps
    end
  end
end
