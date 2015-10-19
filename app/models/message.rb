class Message < ActiveRecord::Base

	has_and_belongs_to_many :user_friendships
	belongs_to :user

end
