class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]
	 
  def create # POST /api/v1/login
	@user = User.find_by(user_name: user_login_params[:user_name])
	# byebug
	  #User#authenticate comes from BCrypt
	  if @user && @user.authenticate(user_login_params[:password])
		  # encode token comes from ApplicationController
		  @token = encode_token({ user_id: @user.id })
			  render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
	  else
		  render json: { message: 'Invalid username or password' }, status: :unauthorized
	  end
  end
  
	  private
  
	  def user_login_params
		  # params { user: {user_name: 'Chandler Bing', password: 'hi' } }
		  params.require(:user).permit(:user_name, :password)
	  end
  end