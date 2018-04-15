json.extract! member, :id, :first_name, :last_name, :date_of_birth, :race, :residential_address, :code, :cell_number, :email, :current_weight, :current_height, :belt, :is_affiliated, :created_at, :updated_at
json.url member_url(member, format: :json)
