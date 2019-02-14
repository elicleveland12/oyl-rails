class Appointment < ApplicationRecord
  belongs_to :mechanic, :optional => true
  belongs_to :vehicle

  


end
