require 'pg'

class Bookings
  attr_reader :start_date, :end_date

  @@connection = nil

  def self.connect(dbname)
    @@connection = PG.connect(dbname: db)
  end

  def self.list_bookings
    result = @@connection.exec('SELECT start_date, end_date FROM bookings;')
    result.map{ |booking| booking}
  end

    attr_reader :booked

  def self.booked(start_date, end_date)
    @@connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{start_date}', '#{end_date}');")
    connection
  end

end

