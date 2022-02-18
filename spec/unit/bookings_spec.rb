require 'bookings'

describe Bookings do
  describe '.list_bookings' do
    it 'lists booked dates' do
      results = Bookings.list_bookings
      expect(results).to have_key (:start_date)
    end
  end

  describe 'shows calendar' do
    it 'shows dates' do
      result = Bookings.bookingsform
      expect(result).to include("Choose your dates:")
    end
  end

end