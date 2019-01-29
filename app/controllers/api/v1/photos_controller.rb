class Api::V1::PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show 
		@photo = Photo.find_by[id: params[:id]]
		render :json @photo
	end

	def create 
		@photo = Photo.create(user: current_user, @restaurant, url: params[:restaurant][:restaurant_photo])
	end


end
