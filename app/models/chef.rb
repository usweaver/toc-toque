class Chef < ApplicationRecord
  has_one_attached :chef_picture
  belongs_to :user
  has_many :bookings

  include PgSearch::Model
  pg_search_scope :search_chef,
  against: [ :first_name, :last_name, :city, :category ],
  using: {
    tsearch: { prefix: true }
  }

end
