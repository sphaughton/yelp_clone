require 'rails_helper'

feature 'Reviews' do 

  before do 
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end


  scenario 'are left by user using a form' do 
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'are deleted when associated restaurant is deleted' do
    click_link 'Delete KFC'
    expect(current_path).to eq '/restaurants'
    expect(page).to_not have_content('so so')
  end

  scenario 'can only be left by a user on the same restaurant once' do
    click_link 'Review KFC'
    fill_in "Thoughts", with: "More thoughts"
    select '1', from: 'Rating'
    click_button 'Leave Review'
    expect(page).to have_content('You have already reviewed this restaurant')
  end

end