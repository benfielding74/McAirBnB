# frozen_string_literal: true

require 'pg'

class Bookings
  attr_reader :start_date, :end_date, :booked

  @@connection = nil

  def self.connect(dbname)
    @@connection = PG.connect(dbname: dbname)
  end

  def self.list_bookings
    result = @@connection.exec('SELECT start_date, end_date FROM bookings;')
    result.map { |booking| booking }
  end

  def self.booked(start_date, end_date)
    @@connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{start_date}', '#{end_date}');")
    connection
  end
end
