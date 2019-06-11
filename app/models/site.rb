class Site < ApplicationRecord
  validates :long_url, presence: true
  validates :long_url, uniqueness: true

  scope :most_visited, -> { all.order(visits: :desc).limit(100) }
end
