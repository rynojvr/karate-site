class District < ApplicationRecord
  belongs_to :province
  has_many :clubs
end
