class Appointment < ApplicationRecord
  belongs_to :mechanic
  belongs_to :vehicle
end
