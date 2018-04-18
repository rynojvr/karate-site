class AddClubToMember < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :club, foreign_key: true
  end
end
