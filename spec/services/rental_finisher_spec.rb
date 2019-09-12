require 'rails_helper'

describe RentalFinisher do
	describe '#finish' do
		it 'should finish the rental and notifiy the customer' do
			subsidiary = create(:subsidiary)
			manufacture = create(:manufacture)
			user = create(:user, subsidiary: subsidiary)
    	car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
	 		car = create(:car, car_model: car_model, license_plate: 'XLG-1234',
	                       subsidiary: subsidiary, car_km: '100', status: :rented)
	    customer = create(:personal_customer, email: 'lucas@gmail.com')
	    rental = create(:rental, car: car, customer: customer, user: user, status: :active)

	    now = Time.zone.now #mock 1
	    allow(Time.zone).to receive(:now).and_return(now)

	    mailer = double('Mailer') #mock 1
	    allow(RentalMailer).to receice(:send_return_receipt).with(rental.id).and_return(mailer)
	    allow(mailer).to receive(:deliver_now)

	    described_class.new(rental, 200).finish

	    expect(car.car_km).to eq 200
	    expect(car.available?).to be true
	    expect(rental.finished?).to be true
	    expect(rental.finished_at).to be now
	    expect(mailer).to have_received(:deliver_now)

		end
	end
end