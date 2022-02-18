# frozen_string_literal: true

require 'bookings'

describe Bookings do
  describe '.list_bookings' do
    it 'lists booked dates' do
      Bookings.connect('mcairbnb_test')
      results = Bookings.list_bookings.first
      expect(results).to have_key('start_date')
    end
  end


  describe 'shows calendar' do
    it 'shows dates' do
      result = Bookings.bookingsform
      expect(result).to include("Choose your dates:")
    end
  end
end


