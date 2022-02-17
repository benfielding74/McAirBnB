feature 'Listing a home' do
  scenario 'the user has a form to list spaces' do
    visit('/home')
    find_field('name').visible?
    find_field('description').visible?
    find_field('price').visible?
    find_button('Submit listing').click
  end

  scenario 'the user can submit a listing and it appears on the page' do
    visit('/home')
    fill_in('name', with: 'Lovely home')
    fill_in('description', with: 'Two bedroom cottage in quiet area with lovely views')
    fill_in('price', with: '50')
    click_button('Submit listing')
    expect(page).to have_content('Lovely home')
  end
end
