feature 'viewing index page' do
  scenario 'signup to application' do
    visit('/index')
    expect(page).to have_content "Welcome to McAirbnb"
  end
end