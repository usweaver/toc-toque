class Chef < ApplicationRecord
  has_one_attached :chef_picture
  belongs_to :user
  has_many :bookings
end
