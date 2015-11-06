# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(
  username: "potus",
  firstname: "Barack",
  lastname: "Obama",
  email: "potus@usa.gov",
  password: "password",
  password_confirmation: "password"
  )
Timeslot.create(
  title: "I'm the president!",
  body: "Ask me anything!!!!!!!!!",
  image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png",
  slot_start: DateTime.new(2015, 11, 20, 18,0,0),
  slot_end: DateTime.new(2015, 11, 20, 19,0,0),
  user_id: user.id
)
