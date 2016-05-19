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

2.times do |num|
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

    user = User.create({name: FFaker::Name.first_name, email: FFaker::Internet.email, phone: FFaker::PhoneNumber.short_phone_number, password: "a", photo: "http://eadb.org/wp-content/uploads/2015/08/profile-placeholder.jpg"})
    user.chores << chore_arr[i]
    i % 2 === 0 ?  bool = true : bool = false
      UserChore.where(user_id: user.id).first.update({completed: bool, due_date: Time.at(Time.now.to_i + 604800)})
    unit.users << user
    UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: user.id.to_s}).first.update(state: "approved")
  end
  blocked_user = User.create({name: "Justin", email: "j#{num}@gmail.com", phone: "555-867-5309", password: "a", photo: "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/6532/thumb_a4430b9d-b7a4-4624-9967-5b324e73eaec.jpg"})
  unit.users << blocked_user
  UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: blocked_user.id.to_s}).first.update(state: "approved")
  pending_user = User.create({name: FFaker::Name.first_name, email: FFaker::Internet.email, phone: FFaker::PhoneNumber.short_phone_number, password: "a", photo: "http://eadb.org/wp-content/uploads/2015/08/profile-placeholder.jpg"})
  unit.users << pending_user
  UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: pending_user.id.to_s}).first.update(state: "pending")
end


puts("#{Unit.count} Units created | #{User.count} Users created | #{Chore.count} Chores created")
