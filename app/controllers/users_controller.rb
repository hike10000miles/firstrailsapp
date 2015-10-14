class UsersController < ApplicationController

	# show sig up form
	def index
		@current_user = User.find_by_id(session[:user_id])
		@users = User.all
	end

	def show
		@current_user = User.find_by_id(session[:user_id])
		@reservations = @current_user.reservations
	end

	def new
		@user = User.new
	end

	# create user in database
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to cuisine_types_path
		else 
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end