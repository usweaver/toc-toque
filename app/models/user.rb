class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_picture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :chefs
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true
  validates :profile_picture, presence: true
end
