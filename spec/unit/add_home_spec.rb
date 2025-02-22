# frozen_string_literal: true

require 'user'

describe User do
  describe '.add_home' do
    it 'allows a user to add a property' do
      User.connect('mcairbnb_test')
      connection = User.add_home('The Mews', 'A wonderful home', '9.99')
      result = connection.exec('SELECT * FROM homes')
      result = result.map { |home| home['name'] }
      expect(result).to include('The Mews')
    end
  end
end
