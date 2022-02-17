require 'pg'

class Bookings
  attr_reader :start_date, :end_date

  def self.list_bookings
    connection = PG.connect(dbname: "mcairbnb")
    result = connection.exec('SELECT start_date, end_date FROM bookings;')
    result.map{ |booking| booking}
  end

    attr_reader :booked

  def self.booked(start_date, end_date, db = 'mcairbnb')
    @start_date = start_date
    @end_date = end_date
    connection = PG.connect(dbname: db)
    connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('#{@start_date}', '#{@end_date}');")
    connection
  end

end

