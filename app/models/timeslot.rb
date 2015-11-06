class Timeslot < ActiveRecord::Base
  belongs_to :user
  has_many :pitches
  has_many :appointments
end
