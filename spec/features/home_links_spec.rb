# frozen_string_literal: true

feature 'home links' do
  scenario 'can follow links from /homes to pages with info about homes' do
    visit '/home'
    click_link('example_name')
    expect(page).to have_content('example_description')
  end
end
