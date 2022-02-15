require 'pg'

class Home

  @@connection = nil

  def self.connect(dbname)
    @@connection = PG.connect(dbname: dbname)
  end

  def self.list_homes
    result = @@connection.exec('SELECT * FROM homes;')
    result.map { |home| home['name'] }
  end

end
