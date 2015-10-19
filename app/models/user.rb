class User < ActiveRecord::Base

	has_secure_password
	has_many :reservations
	has_many :restaurants, :through => :reservations
	has_many :user_friendships
	has_many :friends, :through => :user_friendships
	has_many :messages

	validates :email, uniqueness: true
end
