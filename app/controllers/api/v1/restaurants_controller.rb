class Api::V1::RestaurantsController < ApplicationController
	before_action :find_restaurant, to: [:show, :destroy, :edit, :update]
 
	def index
	  @restaurants = Restaurant.all
	  if params[:search]
		@restaurants = Restaurant.search(params[:search])
		render json: @restaurants
	  else
		@restaurants = Restaurant.all
		render json: @restaurants
	  end
	end
  
	def show
	  render json: @restaurant
	end
  
	# def new
	#   @restaurant = Restaurant.new
	# end
  
	# def create
	#   @restaurant = Restaurant.create(restaurant_params)
	#   if @restaurant.valid?
	# 	redirect_to restaurant_path(@restaurant)
	#   else
	# 	flash[:errors] = @restaurant.errors.full_messages
	# 	redirect_to new_restaurant_path
	#   end
	# end
  
	# def edit
	# end
  
	def update
	  # if restaurant_params[:restaurant_photo]
	  #   restaurant_params[:restaurant_photo] = restaurant_params[:restaurant_photo].original_filename
	  # end
  
	  @restaurant.update_attributes(restaurant_params)
	  Photo.create(user: current_user, restaurant: @restaurant, url: params[:restaurant][:restaurant_photo])
	  render json: @restaurant
	  # byebug
	end
  
	# def destroy
	#   @restaurant.destroy
	#   redirect_to restaurants_path
	# end
  
  
	private
	def restaurant_params
	  params.require(:restaurant).permit(:name, :address, :phone, :credit_card, :delivery, :longitude, :latitude, :search, :restaurant_photo)
	end
  
	def find_restaurant
	  @restaurant = Restaurant.find_by(id: params[:id])
	end
  
	def update_rest_photo
	  update_photo = params.require(:restaurant).permit(:restaurant_photo).original_filename
	end
  end