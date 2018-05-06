class Club < ApplicationRecord
  has_many :members
  belongs_to :district
end
