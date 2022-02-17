
# frozen_string_literal: true

feature 'viewing index page' do
  scenario 'signup to application' do
    visit('/')
    click_button('signup')
    fill_in('user_name', with: 'John')
    fill_in('email', with: 'John@hotmail.com')
    fill_in('password', with: 'Seekrit')
    click_button('Create your account')
    expect(page).to have_content 'Welcome to McAirBnB John'
  end
end

