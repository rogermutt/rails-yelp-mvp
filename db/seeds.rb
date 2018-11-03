require 'faker'

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts 'Starting Seeding'
5.times do
  content = {
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    phone_number: Faker::IDNumber.valid,
    category: CATEGORIES.sample
            }
  resto = Restaurant.new(content)
  resto.save

  puts 'Reso created'
end
puts 'Finished Seeding'
