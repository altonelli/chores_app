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
unit_arr = []

2.times do
  unit = Unit.create({address: FFaker::Address.street_address,
                     name: FFaker::Company.name,
                     landlord_name: FFaker::Name.first_name,
                     landlord_phone: FFaker::PhoneNumber.short_phone_number,
                     landlord_email: FFaker::Internet.email})

  kitchen = Chore.create({
  title: "Kitchen",
  details: "Clean it."
  })
  bathroom = Chore.create({
  title: "Bathroom",
  details: "Clean it."
  })
  living_room = Chore.create({
    title: "Living Room",
    details: "Clean it."
    })
  ice_cream = Chore.create({
  title: "Ice Cream",
  details: "Buy it."
  })

  chore_arr = [kitchen,bathroom,living_room,ice_cream]

  4.times do |i|
    user = User.create({name: FFaker::Name.first_name, email: FFaker::Internet.email, password: "a", phone: FFaker::PhoneNumber.short_phone_number})
    user.chores << chore_arr[i]
    i % 2 === 0 ?  bool = true : bool = false
      UserChore.where(user_id: user.id).first.update({completed: bool, due_date: Time.at(Time.now.to_i + 604800)})
    unit.users << user
  end
end


puts("#{Unit.count} Units created | #{User.count} Users created | #{Chore.count} Chores created")
