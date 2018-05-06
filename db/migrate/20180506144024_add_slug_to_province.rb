class AddSlugToProvince < ActiveRecord::Migration[5.1]
  def change
    add_column :provinces, :slug, :string
  end
end
