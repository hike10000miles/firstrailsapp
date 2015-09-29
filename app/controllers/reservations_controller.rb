class ReservationsController < ApplicationController

	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservations = @restaurant.reservations
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new(reservation_params)
		@reservation.restaurant = @restaurant
		if  @reservation.save
			redirect_to [@restaurant, @reservation]
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservations = @restaurant.reservations
	end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :seating_time)
	end
end