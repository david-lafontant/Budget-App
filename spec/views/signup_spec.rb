require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      visit '/users/sign_up'
    end

    scenario ' I can sign up all user details' do
      fill_in 'Name', with: 'User'
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password: 6 characters minimum.', with: '123456'
      fill_in 'Confirm Password', with: '123456'
      click_button 'Next'

      expect(page).to have_content('Welcome! You have signed up successfully')
    end

    scenario ' I can not sign up without user name user details' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'user@gmail.com'
      fill_in 'Password: 6 characters minimum.', with: '123456'
      fill_in 'Confirm Password', with: '123456'
      click_button 'Next'

      expect(page).to have_content("Name can't be blank Name is too short (minimum is 3 characters)")
    end
  end
end
