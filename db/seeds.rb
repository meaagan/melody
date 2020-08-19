User.destroy_all
Booking.destroy_all
Instrument.destroy_all

user1 = User.create!(email: "sarah@email.com", password: "123456", first_name: "Sarah", last_name: "Croche", address: "4520 Rue Boyer, Montréal, QC H2J 3E4")
user2 = User.create!(email: "john@email.com", password: "123456", first_name: "John", last_name: "Doe", address: "4453 Ave Christophe-Colomb, Montreal, QC H2J 3G4")
user3 = User.create!(email: "pierre@email.com", password: "123456", first_name: "Pierre", last_name: "Paul Jacques", address: "4363 Rue de la Roche, Montréal, QC H2J 3J2")

100.times do
  category = Instrument::CATEGORY.sample
  Instrument.create!(
    category: category,
    name: "#{Faker::Color.color_name} #{category}",
    price: Faker::Number.number(digits: 2),
    location: ["Montreal", "Sherbrooke", "Quebec City", "Toronto", "Vancouver"].sample,
    description: Faker::Lorem.paragraph,
    user: [user1, user2, user3].sample
    )
end

Booking.create!(user: user1, instrument: Instrument.first, content: "Please I want this instrument")
Booking.create!(user: user1, instrument: Instrument.second, content: "Hello, I would like to rent your instrument")
Booking.create!(user: user2, instrument: Instrument.second, content: "Hello, I would like to rent your instrument :)")
Booking.create!(user: user2, instrument: Instrument.third, content: "Hi, I would like to rent your instrument")
Booking.create!(user: user3, instrument: Instrument.fourth, content: "Hi, I would like to rent your instrument")
