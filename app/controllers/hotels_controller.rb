class HotelsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @hotels = Hotel.all
    @hotel = Hotel.order("created_at DESC")
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to hotel_path(@hotel)
    else
      render :new
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
    redirect_to root_path
    else
    render :edit
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @review = Review.new
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :category_id, :image)
  end
end
