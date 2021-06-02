class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  validates :total_score, presence: true
end
