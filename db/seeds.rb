# Provinces
puts "[+] Creating Provinces..."
# Info pulled from https://www.wikiwand.com/en/Districts_of_South_Africa
provinces = [{
  name: 'Eastern Cape',
  slug: 'eastern-cape',
    districts: [{
        name: 'Alfred Nzo District Municipality',
        slug: 'alfred-nzo'
      }, {
        name: 'Amathole District Municipality',
        slug: 'amathole'
      }, {
        name: 'Buffalo City Metropolitan Municipality',
        slug: 'buffalo-city'
      }, {
        name: 'Chris Hani District Municipality',
        slug: 'chris-hani'
      }, {
        name: 'Joe Gqabi District Municipality',
        slug: 'joe-gqabi'
      }, {
        name: 'Nelson Mandela Bay Metropolitan Municipality',
        slug: 'nelson-mandela-bay'
      }, {
        name: 'OR Tambo District Municipality',
        slug: 'or-tambo'
      }, {
        name: 'Sarah Baartman District Municipality',
        slug: 'sarah-baartman'
      }
    ]
  }, {
    name: 'Free State',
    slug: 'free-state',
    districts: [{
        name: 'Felize Dabi District Municipality',
        slug: 'felize-dabi'
      }, {
        name: 'Lejweleputswa District Municipality',
        slug: 'lejweleputswa'
      }, {
        name: 'Mangaung Metropolitan Municipality',
        slug: 'mangaung'
      }, {
        name: 'Thabo Mofutsanyana District Municipality',
        slug: 'thabo-mofutsanyana'
      }, {
        name: 'XHariep District Municipality',
        slug: 'xhariep'
      }
    ]
  }, {
    name: 'Gauteng',
    slug: 'gauteng',
    districts: [{
        name: 'City of Johannesburg Metropolitan Municipality',
        slug: 'johannesburg'
      }, {
        name: 'City of Tshwane Metropolitan Municipality',
        slug: 'tshwane'
      }, {
        name: 'Ekurhuleni Metropolitan Municipality',
        slug: 'ekurhuleni'
      }, {
        name: 'Sedibeng District Municipality',
        slug: 'sedibeng'
      }, {
        name: 'West Rand District Municipality',
        slug: 'west-rand'
      }
    ]
  }, {
    name: 'KwaZulu-Natal',
    slug: 'kwazulu-natal',
    districts: [{
        name: 'Amajuba District Municipality',
        slug: 'amajuba'
      }, {
        name: 'eThekwini Metropolitan Municipality',
        slug: 'ethekwini'
      }, {
        name: 'Harry Gwala District Municipality',
        slug: 'harry-gwala'
      }, {
        name: 'iLembe District Municipality',
        slug: 'ilembe'
      }, {
        name: 'King Cetshwayo District Municipality',
        slug: 'king-cetshwayo'
      }, {
        name: 'Ugu District Municipality',
        slug: 'ugu'
      }, {
        name: 'uMgungundlovu District Municipality',
        slug: 'umgungundlovu'
      }, {
        name: 'uMkhanyakude District Municipality',
        slug: 'umkhanyakude'
      }, {
        name: 'uMzinyathi District Municipality',
        slug: 'umzinyathi'
      }, {
        name: 'uThukela District Municipality',
        slug: 'uthukela'
      }, {
        name: 'Zululand District Municipality',
        slug: 'zululand'
      }
    ]
  }, {
    name: 'Limpopo',
    slug: 'limpopo',
    districts: [{
        name: 'Capricorn District Municipality',
        slug: 'capricorn'
      }, {
        name: 'Mopani District Municipality',
        slug: 'mopani'
      }, {
        name: 'Sekhukune District Municipality',
        slug: 'sekhukune'
      }, {
        name: 'Vhembe District Municipality',
        slug: 'vhembe'
      }, {
        name: 'Waterberg District Municipality',
        slug: 'waterberg'
      }
    ]
  }, {
    name: 'Mpumalanga',
    slug: 'mpumalanga',
    districts: [{
        name: 'Ehlanzeni District Municipality',
        slug: 'ehlenzeni'
      }, {
        name: 'Gert Sibande District Municipality',
        slug: 'gert-sibande'
      }, {
        name: 'Nkangala District Municipality',
        slug: 'nkangala'
      }
    ]
  }, {
    name: 'North West',
    slug: 'north-west',
    districts: [{
        name: 'Bojanala Platinum District Municipality',
        slug: 'bojanala-platinum'
      }, {
        name: 'Dr Kenneth Kaunda District Municipality',
        slug: 'dr-kenneth-kaunda'
      }, {
        name: 'Dr Ruth Segomotsi Mompati District Municipality',
        slug: 'dr-ruth-segomotsi-mompati'
      }, {
        name: 'Ngaka Modiri Molema District Municipality',
        slug: 'ngaka-modiri-molema'
      }
    ]
  }, {
    name: 'Northern Cape',
    slug: 'northern-cape',
    districts: [{
        name: 'Frances Baard District Municipality',
        slug: 'frances-baard'
      }, {
        name: 'John Taolo Gaetsewe District Municipality',
        slug: 'john-taolo-gaetsewe'
      }, {
        name: 'Namakwa District Municipality',
        slug: 'namakawa'
      }, {
        name: 'Pixley ka Seme District Municipality',
        slug: 'pixley-ka-seme'
      }, {
        name: 'ZF Mgcawu District Municipality',
        slug: 'zf-mgcawu'
      }
    ]
  }, {
    name: 'Western Cape',
    slug: 'western-cape',
    districts: [{
        name: 'Cape Winelands District Municipality',
        slug: 'cape-winelands'
      }, {
        name: 'Central Karoo District Municipality',
        slug: 'central-karoo'
      }, {
        name: 'City of Cape Town Metropolitan Municipality',
        slug: 'cape-town'
      }, {
        name: 'Eden District Municipality',
        slug: 'eden'
      }, {
        name: 'Overberg District Municipality',
        slug: 'overberg'
      }, {
        name: 'West Coast District Municipality',
        slug: 'west-coast'
      }
    ]
  }
]

provinces.each do |prov_data|
  # Create Provinces
  prov = Province.find_or_create_by(
    name: prov_data[:name],
    slug: prov_data[:slug]
  )
  prov_data[:districts].each do |district_data|
    # Create Districts
    dist = prov.districts.find_or_create_by(district_data)

    if not Rails.env.production?
      # Only when seeding the first time. Idempotency and whatnot
      if dist.clubs.count == 0
        num_clubs = rand(1..5)
        puts "[+] Creating clubs..." if dist.clubs.count < num_clubs
        while dist.clubs.count < num_clubs do
          club_name = "#{Faker::Company.name} Dojo"
          puts "[+] Creating club '#{club_name}'"
          club = dist.clubs.create(
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
      end
    end

  end
end
