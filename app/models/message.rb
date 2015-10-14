class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :user_friendship
end
