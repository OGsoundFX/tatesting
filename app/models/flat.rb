class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_flat_location_title_and_description,
    against: [ :location, :description, :title ],
    using: {
      tsearch: { prefix: true }
    }

end
