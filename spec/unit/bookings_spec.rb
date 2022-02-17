# frozen_string_literal: true

require 'bookings'

describe Bookings do
  describe '.list_bookings' do
    it 'lists booked dates' do
      Bookings.connect("mcairbnb_test")
      results = Bookings.list_bookings.first
      expect(results).to have_key('start_date')
    end
  end
end
