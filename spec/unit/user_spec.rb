# frozen_string_literal: true

require 'user'

describe User do
  before(:all) {User.connect('mcairbnb_test')}
  describe '.signup' do
    it 'creates a new user' do
      connection = User.signup('John', 'Seekrit')
      result = connection.exec('SELECT name FROM users')
      result = result.map { |user| user['name'] }
      expect(result).to include('John')
    end
  end

  describe '.login' do
    it 'checks password is correct' do
      result = User.login('Ben', 'Password')
      expect(result).to eq false
    end

    it 'prompts to re-enter if name or password is incorrect' do
      connection = User.signup('Benf', 'Seekrit')
      result = User.login('Steve', 'Seekrit')
      expect(result).to eq false
    end

    it 'allows a user to log in with correct credentials' do
      connection = User.signup('Barrington', 'SuperUser')
      result = User.login('Barrington', 'SuperUser')
      expect(result).to eq true
    end
  end
end
