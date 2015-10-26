class MessagesController < ApplicationController
	
	def index
		@current_user = User.find_by_id(session[:user_id])
		@user_friendship = UserFriendship.find(params[:user_friendship_id])
		@sent_messages = @user_friendship.messages.all
	end

	def inbox
		@current_user = User.find_by_id(session[:user_id])
		@conter_friendships = UserFriendship.where(friend_id: @current_user.id)
	end

	def new
		@current_user = User.find_by_id(session[:user_id])
		@message = Message.new
		@user_friendship = UserFriendship.find(params[:user_friendship_id])
	end

	def create
		@current_user = User.find_by_id(session[:user_id])
		@message = Message.new(message_params)
		@user_friendship = UserFriendship.find(params[:user_friendship_id])

		if @message.save
			@user_friendship.messages << @message
			redirect_to [@current_user]
		else
			render 'new'
		end
	end

	private
	def message_params
		params.require(:message).permit(:title, :content, :user_id)
	end
end
