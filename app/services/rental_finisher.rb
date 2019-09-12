class RentalFinisher

	def initialize(rental, new_km)
		@rental = rental
		@new_km = new_km
		@customer = rental.customer
		@car = rental.car
	end

	def finish()
		@car.update(car_km: new_km)
		@car.available!
		@rental.update(status: :finished)
		@rental.finished_at(now)

		finish_rental
		notify_customer

	end

	private
	attr_reader :rental, :new_km

end