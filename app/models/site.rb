class Site < ApplicationRecord
  validates :long_url, presence: true
end
