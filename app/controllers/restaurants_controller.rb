class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  CATEGORIES = %w[chinese italian japanese french belgian].freeze

  def show
  end

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.category = CATEGORIES[@restaurant[:category].to_i]
    @restaurant.save!
    redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.new
    @categories = CATEGORIES
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
