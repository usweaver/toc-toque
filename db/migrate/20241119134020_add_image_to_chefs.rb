class AddImageToChefs < ActiveRecord::Migration[7.1]
  def change
    add_column :chefs, :profile_picture_url, :string
  end
end
