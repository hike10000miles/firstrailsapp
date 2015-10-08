class Reservation < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user

	validate :capacity_exists

	def capacity_exists
		existing_reservation = Reservation.where("restaurant_id = ? and seating_time > ? and seating_time < ?", self.restaurant_id, self.seating_time.at_beginning_of_hour, self.seating_time.at_end_of_hour)
		total_people = existing_reservation.sum(:party_size)
		if (total_people + self.party_size) > self.restaurant.capacity
			errors.add(:party_size, "Capacity exceeded")
		end
	end

end
