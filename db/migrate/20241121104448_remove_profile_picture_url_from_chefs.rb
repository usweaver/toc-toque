class RemoveProfilePictureUrlFromChefs < ActiveRecord::Migration[7.1]
  def change
    remove_column :chefs, :profile_picture_url, :string
  end
end
