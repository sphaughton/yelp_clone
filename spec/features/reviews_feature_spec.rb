require 'rails_helper'

feature 'reviewing' do 
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do 
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'allows reviews to be deleted when associated restaurant is deleted' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Delete KFC'

    expect(current_path).to eq '/restaurants'
    expect(page).to_not have_content('so so')
  end

end