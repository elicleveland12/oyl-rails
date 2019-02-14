class Vehicle < ApplicationRecord
  has_many :appointments
  has_many :mechanics, through: :appointments
  belongs_to :user

  oil_type_arr = ["0W-20", "0W-30", "0W-40", "5W-20", "5W-30", "5W-40", "10W-60", "10W-40", "15W-40"]

end
