require 'rails_helper'

describe 'security' do
  describe 'creating an account' do
    it 'can create an account' do
      visit '/'
      create_account
      
      expect(page).to have_content("My Accounts")
    end
  end

  describe 'logging in' do
    it 'can log in with an existing account' do
      user = create(:user)
      visit '/'

      click_link_or_button 'Sign In'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_link_or_button 'Log in'

      expect(page).to have_content("My Accounts")
    end
  end

  def create_account
    click_link_or_button 'Create Account'
    fill_in 'user_email', with: 'rockin@awesome.com'
    fill_in 'user_password', with: 'weloveithere'
    fill_in 'user_password_confirmation', with: 'weloveithere'
    click_link_or_button 'Sign up'
  end
end
