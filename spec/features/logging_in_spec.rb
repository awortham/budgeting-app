require 'rails_helper'

describe 'security' do
  describe 'creating an account' do
    it 'can create an account' do
      visit '/'
      click_link_or_button 'Create Account'
      fill_in 'user_name', with: 'Dominick'
      fill_in 'user_encrypted_password', with: 'Sanchez2'
      click_link_or_button 'Submit'
      expect(page).to have_content("Dashboard")
    end
  end

  describe 'logging in' do
  end
end
