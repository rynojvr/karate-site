class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :cell
      t.string :email
      t.string :sensei
      t.string :contact_number
      t.string :cell
      t.string :landline

      t.timestamps
    end
  end
end
