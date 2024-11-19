class CreateChefs < ActiveRecord::Migration[7.1]
  def change
    create_table :chefs do |t|
      t.string :first_name
      t.string :last_name
      t.string :category
      t.string :phone_number
      t.string :email
      t.integer :daily_price
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
