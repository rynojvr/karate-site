class AddSlugToDistrict < ActiveRecord::Migration[5.1]
  def change
    add_column :districts, :slug, :string, index: true
  end
end
