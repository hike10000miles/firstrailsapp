class UserReservationsController < ApplicationController

	before_action :authenticate_user 

	def show
		@current_user = User.find_by_id(session[:user_id])
		@reservation = @current_user.reservations.find(params[:id])
		@restaurant = @reservation.restaurant
	end

	def edit
		@current_user = User.find_by_id(session[:user_id])
		@reservation = @current_user.reservations.find(params[:id])
	end

	def update
		@current_user = User.find_by_id(session[:user_id])
		@reservation = @current_user.reservations.find(params[:id])

		if @reservation.update(reservation_params)
			redirect_to @current_user
		else
			render 'edit' 
		end
	end

	def destroy
		@current_user = User.find_by_id(session[:user_id])
		@reservation = @current_user.reservations.find(params[:id])
		@reservation.destroy
 
    	redirect_to @current_user
    end

	private
	def reservation_params
		params.require(:reservation).permit(:party_size, :seating_time)
	end

end