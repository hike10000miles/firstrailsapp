class Restaurant < ActiveRecord::Base
	
	belongs_to :cuisine_type
	has_many :reservations

	validates :name, :capacity, presence: true
	validate :capacity_must_be_even_number

	def capacity_must_be_even_number
		if capacity && capacity.odd?
			errors.add(:capacity, "Must be even number")
		end
	end

end
