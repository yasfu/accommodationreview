class HotelsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :search_hotel, only: [:index, :search]
  def index
    @hotels = Hotel.all.page(params[:page]).per(5)
    @hotel = Hotel.order('created_at DESC')
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

  def search
    @hotels = @p.result
    @hotels = @hotels.page(params[:page])
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :category_id, :image)
  end

  def search_hotel
    @p = Hotel.ransack(params[:q])
  end
end
