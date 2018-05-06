class District < ApplicationRecord
  belongs_to :province
  has_many :clubs

  def to_param
    slug
  end
end
