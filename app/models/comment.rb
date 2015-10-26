class Comment < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user

	validates :title, length: {in: 1..70}
	validates :text, length: {in: 10..300}

end
