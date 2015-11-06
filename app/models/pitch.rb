class Pitch < ActiveRecord::Base
  belongs_to :timeslot
  belongs_to :user
  has_one :appointment
end
