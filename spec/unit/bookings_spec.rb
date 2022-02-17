require 'bookings'

describe Bookings do
  describe '.list_bookings' do
    it 'lists booked dates' do
      results = Bookings.list_bookings
      expect(results).to have_key (:start_date)
    end
  end
end