class SessionsController < ApplicationController

	def new
	end

	# log in
	def create
		@user = User.find_by_email(params[:email])
		if @user 
			session[:user_id] = @user.id
			redirect_to cuisine_types_path
		else
			render :new
		end
	end

	# log out
	def destroy
		session[:user_id] = nil
		redirect_to cuisine_types_path		
	end

end