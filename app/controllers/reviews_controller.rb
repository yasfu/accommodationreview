class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @reviews = @hotel.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to hotel_reviews_path(@review.hotel)
    else
      @hotel = Hotel.find(params[:hotel_id])
      render "hotels/show"
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @review = @hotel.reviews.find(params[:id])
    @review.destroy
    if
      redirect_to hotel_reviews_path(@review.hotel)
    end
  end

  private
  def review_params
    params.require(:review).permit( :total_score, :comment).merge(user_id: current_user.id,hotel_id: params[:hotel_id])
  end
end
