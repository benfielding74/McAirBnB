feature 'authentication' do
  it 'a user can sign in' do
    User.signup('John', 'Password123')

    visit '/login'
    fill_in(:user_name, with: 'John')
    fill_in(:password, with: 'Password123')
    click_button('Login')

    expect(page).to have_content 'Welcome to McAirbnb John'
  end
end
