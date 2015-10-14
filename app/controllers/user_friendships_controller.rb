class UserFriendshipsController < ApplicationController

	before_action :authenticate_user 

	def index
		@current_user = User.find(session[:user_id])
		@current_user_friendships = UserFriendship.where(user_id: session[:user_id])
		@current_user_friends = @current_user.friends
	end

	def show
		@friend = User.find(params[:id])
		@current_user_friendships = UserFriendship.where(friend_id: @friend.id)
		@current_user = User.find(session[:user_id])
		@user_friendship = UserFriendship.new
	end

	def create
		@user = User.find_by_id(session[:user_id])
		@userfriendship = UserFriendship.new(user_friendship_params)

		if  @userfriendship.save
			redirect_to @user
		else
			render 'show'
		end
	end

	def edit
	end

	private
	def user_friendship_params
		params.require(:user_friendship).permit(:user_id, :friend_id)
	end
end
