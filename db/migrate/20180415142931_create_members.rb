class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :race
      t.string :residential_address
      t.string :code
      t.string :cell_number
      t.string :email
      t.integer :current_weight
      t.integer :current_height
      t.string :belt
      t.boolean :is_affiliated

      t.timestamps
    end
  end
end
