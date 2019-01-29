class Api::V1::PhotosController < ApplicationController
	def index
		@photos = Photo.all
		render json: @photo
	  end
	
	  def show
		@photo = Photo.find_by[id: params[:id]]
		render json: @photo
	  end
	
	  def create
	  @photo = Photo.create(user: current_user, restaurant: @restaurant, url: params[:restaurant][:restaurant_photo]
		render json: @photo
	  end
	
	  def edit
	  end
	
	  def update
	  end
	
	  def destroy
		@photo = Photo.find_by[id: params[:id]]
		@photo.destroy
	  end
end
