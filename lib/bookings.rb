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
    if Bookings.date_checker(start_date, end_date)
      @@connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{start_date}', '#{end_date}');")
      @@connection
    else
      false 
    end
  end
  
  def self.date_checker(user_start_date, user_end_date)
    start_comp = self.list_bookings.map do |hash|
      (DateTime.parse(hash["start_date"])..DateTime.parse(hash["end_date"])).cover? (DateTime.parse(user_start_date))
    end
    
    end_comp = self.list_bookings.map do |hash|
      (DateTime.parse(hash["start_date"])..DateTime.parse(hash["end_date"])).cover? (DateTime.parse(user_end_date))
    end
    !(start_comp + end_comp).include?(true)
  end
end
