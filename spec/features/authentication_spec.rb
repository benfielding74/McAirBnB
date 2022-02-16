# frozen_string_literal: true

feature 'authentication' do
  it 'a user can sign in' do
    User.connect('mcairbnb')
    User.signup('Steve', 'Password123')

    visit '/login'
    fill_in(:user_name, with: 'Steve')
    fill_in(:password, with: 'Password123')
    click_button('Login')

    expect(page).to have_content 'Welcome to McAirBnB Steve'
  end
end
