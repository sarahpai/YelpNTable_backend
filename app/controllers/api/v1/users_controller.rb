class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create]
    before_action :set_user, only: [:destroy]
  
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
  
  def index
    @users = User.all 
    render json: @users
  end 

  def show
    @user = User.find_by(id: params[:id])
    @restaurant = Restaurant.find_by(id:params[:id])
    render json: @user
  end

  def create
		@user = User.create(user_params)
		  if @user.valid?
			  @token = encode_token(user_id: @user.id)
			    render json: { "user": UserSerializer.new(@user), jwt: @token }, status: :created
      else
        # byebug
			  render json: { error: @user.errors.full_messages }, status: :not_acceptable
		end
  end
  
  def destroy
    @user.destroy
    render json: ['message': "User deleted"]
  end
  
    private
  
  def user_params
    params.require(:user).permit(:user_name, :profile_picture, :email, :first_name, :last_name, :location, :phone, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
