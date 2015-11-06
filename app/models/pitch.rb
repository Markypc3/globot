class Pitch < ActiveRecord::Base
  belongs_to :timeslot
  bleongs_to :user
end
