# Regions
puts "[+] Creating Regions..."
Region.find_or_create_by(name: 'Cape Town')
Region.find_or_create_by(name: 'The Northern Cape')
Region.find_or_create_by(name: 'The Western Cape')
Region.find_or_create_by(name: 'KwaZulu-Natal')
Region.find_or_create_by(name: 'Free State')
Region.find_or_create_by(name: 'Gauteng')
Region.find_or_create_by(name: 'North West Province')
Region.find_or_create_by(name: 'Mpumalanga')
Region.find_or_create_by(name: 'Limpopo')

puts "[+] Creating clubs..." if Club.count < 7
while Club.count < 7 do
  club_name = "#{Faker::Company.name} Dojo"
  puts "[+] Creating club '#{club_name}'"
  club = Club.create(
    name: club_name,
    cell: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.free_email,
    sensei: Faker::Name.name,
    contact_number: Faker::PhoneNumber.cell_phone,
    landline: Faker::PhoneNumber.cell_phone
  )

  num_members = rand(5..45)
  puts "[+] with #{num_members} members..."
  num_members.times do |n|
    # puts "[-] Student ##{n}"
    club.members.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      date_of_birth: Faker::Date.birthday,
      race: Faker::Demographic.race,
      residential_address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state}",
      code: Faker::Address.postcode,
      cell_number: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.free_email,
      belt: %w(
        white
        orange
        yellow
        white-green
        green
        purple
        blue
        brown
        red
        red-black
        black
      ).sample,
      is_affiliated: [true, false].sample
    )
  end
end
