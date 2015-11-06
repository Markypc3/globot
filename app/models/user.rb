class User < ActiveRecord::Base
  has_secure_password
  has_many :timeslots
  has_many :pitches
  has_many :appointments, through: :timeslots
end
