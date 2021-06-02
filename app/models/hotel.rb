class Hotel < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_many :reviews

  def avg_score
    unless self.reviews.empty?
      reviews.average(:total_score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:total_score).round(1).to_f*100/5
    else
      0.0
    end
  end

  validates :name, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
