# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroyin items"
Item.destroy_all
User.destroy_all
puts "creating items"

emre = User.create!(
  email: "logosemre@gmail.com",
  password: 123456
)

raphi = User.create!(
    email: "raphaellasidb@gmail.com",
    password: 123456
  )

  claire = User.create!(
    email: "claire@queen.com",
    password: 123456
  )

  max = User.create!(
    email: "max@maximum.com",
    password: 123456
  )

  edu = User.create!(
    email: "edu@edu.edu",
    password: 123456
  )

3.times do
  Item.create!(name: Faker::Vehicle.make_and_model, category: 'Wheels', user_id: User.all.sample.id)
  Item.create!(name: Faker::Appliance.equipment, category: "Appliances", user_id: User.all.sample.id)
  Item.create!(name: ['Guitar', 'Saxophone', 'Synth', 'Ukulele', 'Cajon'].sample, category: 'Instruments', user_id: User.all.sample.id)
end

  Item.create!(name: 'Drill', category:'Tools', user_id: claire.id)
  Item.create!(name: 'blender', category: 'Household', user_id: emre.id)
