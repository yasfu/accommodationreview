class Hotel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_many :reviews
  has_one_attached :image

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:total_score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:total_score).round(1).to_f * 100 / 5
    end
  end

  with_options presence: true do
    validates :image
    validates :name
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
