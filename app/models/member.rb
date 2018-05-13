class Member < ApplicationRecord
  belongs_to :club
  attr_accessor :age

  mount_uploader :avatar, MemberAvatarUploader

  validates :first_name,
      presence: true,
      length: {
        minimum: 3,
      }
  validates :last_name,
      presence: true,
      length: {
        minimum: 3,
      }
  validates :date_of_birth,
      presence: true
  validates :email,
      format: { with: Devise.email_regexp }

  def age
    now = Time.now.utc.to_date
    now.year - self.date_of_birth.year - ((now.month > self.date_of_birth.month || (now.month == self.date_of_birth.month && now.day >= self.date_of_birth.day)) ? 0 : 1)
  end

end
