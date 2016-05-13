# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Unit.destroy_all
User.destroy_all
Chore.destroy_all
1.times do
  Unit.create({address: FFaker::Address.street_address, name: FFaker::Company.name})
end
unit = Unit.first
kitchen = Chore.create({
name: "Kitchen",
details: "Clean it."
})
bathroom = Chore.create({
name: "Bathroom",
details: "Clean it."
})
living_room = Chore.create({
  name: "Living Room",
  details: "Clean it."
  })
ice_cream = Chore.create({
name: "Ice Cream",
details: "Buy it."
})
chore_arr = [kitchen,bathroom,living_room,ice_cream]
4.times do |i|
  user = User.create({name: FFaker::Name.first_name, email: FFaker::Internet.email, state:"approved"})
  user.chores << chore_arr[i]
  UserChore.where(user_id: user.id).first.update({complete: true})
  unit.users << user
end
user = User.create({name: FFaker::Name.first_name, email: FFaker::Internet.email, state:"block"})
trash = Chore.create({name: "Trash", details: "Take it out."})
user.chores << trash
UserChore.where(user_id: user.id).first.update({complete: false})
unit.users << user
puts("#{Unit.count} Units created | #{User.count} Users created | #{Chore.count} Chores created")
