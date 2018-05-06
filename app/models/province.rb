class Province < ApplicationRecord
  has_many :districts

  def clubs
    @prov_clubs = districts.map { |district| district.clubs }

    @prov_clubs.flatten.sort
  end

  def to_param
    slug
  end
end
