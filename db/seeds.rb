puts "Deleting everything"

User.destroy_all
Booking.destroy_all
Instrument.destroy_all

puts "Creating users"

user1 = User.create!(email: "sarah@email.com", password: "123456", first_name: "Sarah", last_name: "Croche", address: "4520 Rue Boyer, Montréal, QC H2J 3E4")
user2 = User.create!(email: "john@email.com", password: "123456", first_name: "John", last_name: "Doe", address: "4453 Ave Christophe-Colomb, Montreal, QC H2J 3G4")
user3 = User.create!(email: "pierre@email.com", password: "123456", first_name: "Pierre", last_name: "Paul Jacques", address: "4363 Rue de la Roche, Montréal, QC H2J 3J2")
user4 = User.create!(email: "francesca@email.com", password: "123456", first_name: "Francesca", last_name: "Hall", address: "1832 Rue Saint-André, Montréal, QC H2L 3T8")
user5 = User.create!(email: "kyle@email.com", password: "123456", first_name: "Kyle", last_name: "Masterson", address: "3424 Rue de Bullion, Montréal, QC H2X 2Z9")
user6 = User.create!(email: "millie@email.com", password: "123456", first_name: "Millie", last_name: "Senecal", address: "3591 Rue University, Montréal, QC H3A 2B1")
user7 = User.create!(email: "meagan@email.com", password: "123456", first_name: "Meagan", last_name: "Butters", address: "250 Rue Beaudoin, Montréal, QC H4C 2Y2")

millie_instrument = Instrument.create!(category: "Keyboard", name: "Sublim Keyboard", user: user6, price: 190, location: "Montreal", description: "The most famous keyboard in the world")

20.times do
  name = ["Cool", "Rare", "Super", "Vintage", "Broken", "Very beautiful", "Beautifully sounding", "Cursed"].sample
  category = Instrument::CATEGORY.sample
  Instrument.create!(
    category: category,
    name:  "#{name} #{category}".capitalize,
    price: Faker::Number.number(digits: 2),
    location: ["Montreal", "Sherbrooke", "Quebec City", "Toronto", "Vancouver"].sample,
    description: Faker::Lorem.paragraph,
    user: [user4, user5, user6, user7].sample
    )
  puts "Creating instruments #{category}"
end

puts "Creating bookings"

Booking.create!(user: user1, instrument: Instrument.first, content: "Please I want this instrument")
Booking.create!(user: user1, instrument: Instrument.second, content: "Hello, I would like to rent your instrument")
Booking.create!(user: user2, instrument: Instrument.second, content: "Hello, I would like to rent your instrument :)")
Booking.create!(user: user2, instrument: Instrument.third, content: "Hi, I would like to rent your instrument")
Booking.create!(user: user4, instrument: millie_instrument, content: "Hi, I would like to rent your instrument")
Booking.create!(user: user3, instrument: Instrument.fifth, content: "Hi, I would like to rent your instrument")
Booking.create!(user: user4, instrument: Instrument.last, content: "Hi, I would like to rent your instrument")
Booking.create!(user: user5, instrument: Instrument.all[20], content: "Hi, I would like to rent your instrument")
Booking.create!(user: user5, instrument: Instrument.all[19], content: "Hi, I would like to rent your instrument")
Booking.create!(user: user6, instrument: Instrument.all[18], content: "Hi, I would like to rent your instrument")
Booking.create!(user: user5, instrument: Instrument.all[17], content: "Hi, I would like to rent your instrument")

puts "Done!!"
