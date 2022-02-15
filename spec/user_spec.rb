# frozen_string_literal: true

require 'user'

describe User do
  describe '.signup' do
    it 'creates a new user' do
      connection = User.signup('John', 'Seekrit', 'mcairbnb_test')
      result = connection.exec('SELECT name FROM users')
      result = result.map { |user| user['name'] }
      expect(result).to include('John')
    end
  end
end
