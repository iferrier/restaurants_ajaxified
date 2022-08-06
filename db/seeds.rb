puts "Cleaning the DB"
Restaurant.destroy_all

puts "Creating some restaurants"
Restaurant.create!(
  name: "Burgermeister",
  address: "Schlesisches Tor"
)

Restaurant.create!(
  name: "Gazzo",
  address: "Berlin Neukölln"
)

puts "Done!"
