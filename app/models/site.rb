class Site < ApplicationRecord
  validates :long_url, presence: true
  validates :long_url, uniqueness: true
end
