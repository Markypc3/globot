class Appointment < ActiveRecord::Base
  belongs_to :timeslot
  has_one :pitch
end
