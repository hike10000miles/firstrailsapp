class Restaurant < ActiveRecord::Base

	belongs_to :cuisine_type
	has_many :reservations
	has_many :comments
	mount_uploader :image, ImageUploader

	validates :name, length: {in: 1..70}
	validates :capacity, presence: true
	validate :capacity_must_be_even_number

	def capacity_must_be_even_number
		if capacity && capacity.odd?
			errors.add(:capacity, "Must be even number")
		end
	end

end
