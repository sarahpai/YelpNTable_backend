class Api::V1::ReservationsController < ApplicationController
	before_action :find_reservation, only: [:edit, :update, :show, :destroy]

  def index
	@reservations = Reservation.all
	render json: @reservations
  end

  def show
	render json: @reservation
  end

  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def create
    @reservation = Reservation.create(reservation_params)
    @restaurant = Restaurant.find_by(id: @reservation.restaurant_id)
    if @reservation.valid?
	  render json: @reservation
    else
	  render json: { error: @reservation.errors.full_messages}
    end
  end

  def edit
    @restaurant = Restaurant.find_by(id: @reservation.restaurant_id)
    @user = User.find_by(id:params[:id])
  end

  def update
    @reservation.update(reservation_params)
    @restaurant = Restaurant.find_by(id: @reservation.restaurant_id)
    @reservations = Reservation.all
    if @reservation.valid?
	  render json: @reservations
    else
	  render json: { error: @reservation.errors.full_messages}
    end
  end

  def destroy
    @reservation.destroy
	render json: ['message': "Reservation deleted."]
  end

  private
  def reservation_params
    # params[:reservation].parse_time_select! :time
    params.require(:reservation).permit(:restaurant_id, :user_id, :time, :party_size, :message,)
  end

  def find_reservation
    @reservation = Reservation.find_by(id:params[:id])
  end



end
