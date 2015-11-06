class User < ActiveRecord::Base
  has_secure_password
  has_many :timeslots
  has_many :pitches
  has_many :appointments, through: :timeslots

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true


end
