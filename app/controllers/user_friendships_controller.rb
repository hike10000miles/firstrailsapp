class UserFriendshipsController < ApplicationController

	before_action :authenticate_user 

	def index
		@current_user = User.find(session[:user_id])
		@current_user_friendships = UserFriendship.where(user_id: session[:user_id])
		@current_user_friends = @current_user.friends
	end

	def new
		@users = User.all
		@userfriendship = UserFriendship.new
	end

	def create
		@user = User.find_by_id(session[:user_id])
		@userfriendship = UserFriendship.create(user_friendship_params)

		if  @userfriendship.save
			redirect_to @userfriendship
		else
			render 'new'
		end
	end

	def edit
	end

	private
		def user_friendship_params
			params.require(:userfriendship).permit(:user_id, :friend_id)
		end
end
