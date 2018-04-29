# Provinces
puts "[+] Creating Provinces..."
# Info pulled from https://www.wikiwand.com/en/Districts_of_South_Africa
provinces = [{
    name: 'Eastern Cape',
    districts: [{
        name: 'Alfred Nzo District Municipality'
      }, {
        name: 'Amathole District Municipality'
      }, {
        name: 'Buffalo City Metropolitan Municipality'
      }, {
        name: 'Chris Hani District Municipality'
      }, {
        name: 'Joe Gqabi District Municipality'
      }, {
        name: 'Nelson Mandela Bay Metropolitan Municipality'
      }, {
        name: 'OR Tambo District Municipality'
      }, {
        name: 'Sarah Baartman District Municipality'
      }
    ]
  }, {
    name: 'Free State',
    districts: [{
        name: 'Felize Dabi District Municipality'
      }, {
        name: 'Lejweleputswa District Municipality'
      }, {
        name: 'Mangaung Metropolitan Municipality'
      }, {
        name: 'Thabo Mofutsanyana District Municipality'
      }, {
        name: 'XHariep District Municipality'
      }
    ]
  }, {
    name: 'Gauteng',
    districts: [{
        name: 'City of Johannesburg Metropolitan Municipality'
      }, {
        name: 'City of Tshwane Metropolitan Municipality'
      }, {
        name: 'Ekurhuleni Metropolitan Municipality'
      }, {
        name: 'Sedibeng District Municipality'
      }, {
        name: 'West Rand District Municipality'
      }
    ]
  }, {
    name: 'KwaZulu-Natal',
    districts: [{
        name: 'Amajuba District Municipality'
      }, {
        name: 'eThekwini Metropolitan Municipality'
      }, {
        name: 'Harry Gwala District Municipality'
      }, {
        name: 'iLembe District Municipality'
      }, {
        name: 'King Cetshwayo District Municipality'
      }, {
        name: 'Ugu District Municipality'
      }, {
        name: 'uMgungundlovu District Municipality'
      }, {
        name: 'uMkhanyakude District Municipality'
      }, {
        name: 'uMzinyathi District Municipality'
      }, {
        name: 'uThukela District Municipality'
      }, {
        name: 'Zululand District Municipality'
      }
    ]
  }, {
    name: 'Limpopo',
    districts: [{
        name: 'Capricorn District Municipality'
      }, {
        name: 'Mopani District Municipality'
      }, {
        name: 'Sekhukune District Municipality'
      }, {
        name: 'Vhembe District Municipality'
      }, {
        name: 'Waterberg District Municipality'
      }
    ]
  }, {
    name: 'Mpumalanga',
    districts: [{
        name: 'Ehlanzeni District Municipality'
      }, {
        name: 'Gert Sibande District Municipality'
      }, {
        name: 'Nkangala District Municipality'
      }
    ]
  }, {
    name: 'North West',
    districts: [{
        name: 'Bojanala Platinum District Municipality'
      }, {
        name: 'Dr Kenneth Kaunda District Municipality'
      }, {
        name: 'Dr Ruth Segomotsi Mompati District Municipality'
      }, {
        name: 'Ngaka Modiri Molema District Municipality'
      }
    ]
  }, {
    name: 'Northern Cape',
    districts: [{
        name: 'Frances Baard District Municipality'
      }, {
        name: 'John Taolo Gaetsewe District Municipality'
      }, {
        name: 'Namakwa District Municipality'
      }, {
        name: 'Pixley ka Seme District Municipality'
      }, {
        name: 'ZF Mgcawu District Municipality'
      }
    ]
  }, {
    name: 'Western Cape',
    districts: [{
        name: 'Cape Winelands District Municipality'
      }, {
        name: 'Central Karoo District Municipality'
      }, {
        name: 'City of Cape Town Metropolitan Municipality'
      }, {
        name: 'Eden District Municipality'
      }, {
        name: 'Overberg District Municipality'
      }, {
        name: 'West Coast District Municipality'
      }
    ]
  }
]

provinces.each do |prov_data|
  prov = Province.find_or_create_by(name: prov_data[:name])
  prov_data[:districts].each do |district_data|
    prov.districts.find_or_create_by(district_data)
  end
end

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
