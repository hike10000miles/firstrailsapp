class ReservationsController < ApplicationController

	before_action :authenticate_user 

	def index
		@current_user = User.find_by_id(session[:user_id])
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservations = @restaurant.reservations.where(user_id: session[:user_id])
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
	end

	def create
		@current_user = User.find_by_id(session[:user_id])
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.restaurant = @restaurant
		@reservation.user = @current_user
		if  @reservation.save
			redirect_to [@restaurant, @reservation]
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.find(params[:id])

		if @reservation.update(reservation_params)
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.find(params[:id])
		@reservation.destroy
 
    	redirect_to @restaurant
    end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :seating_time)
	end
end