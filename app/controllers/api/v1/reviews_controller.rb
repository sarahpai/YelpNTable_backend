class Api::V1::ReviewsController < ApplicationController
	before_action :find_review, only: [:edit, :update, :show, :destroy]

	def index
	  @reviews = Review.all
	  render json: @reviews
	end
  
	def show
	  render json: @review
	end
  
	def new
	  @review = Review.new
	  @restaurant = Restaurant.find_by(id: params[:id])
	end
  
	def create
	  @review = Review.create(review_params)
	  @restaurant = Restaurant.find_by(id: @review.restaurant_id)
	  if @review.valid?
		render json: @review
	  else
		render json: { error: @review.errors.full_messages}
	end
	end
  
	def edit
	  @restaurants = Restaurant.all
	  @restaurant = Restaurant.find_by(id: @review.restaurant_id)
	  @users = User.all
	end
  
	def update
	  @review.update(review_params)
	  @restaurant = Restaurant.find_by(id: @review.restaurant_id)
	  @user = User.find_by(id:params[:id])
	  if @review.valid?
		render json: @review
	  else
		render json: { error: @review.errors.full_messages}
	  end
	end
  
	def destroy
	  @review.destroy
	  render json: ['message': "Review deleted."]
	end
  
	private
	def review_params
	  params.require(:review).permit(:restaurant_id, :user_id, :title, :comment, :star)
	end
  
	def find_review
	  @review = Review.find_by(id:params[:id])
	end

end
