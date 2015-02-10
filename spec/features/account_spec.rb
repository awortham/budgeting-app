require 'rails_helper'

describe 'account actions' do
  it 'cannot access account dashboard if not logged in' do
    visit accounts_path
    expect(current_path).to eq new_user_session_path
  end

  it 'can access account dashboard if logged in' do
    create_user_and_log_in
    visit accounts_path
    expect(current_path).to eq accounts_path
  end

  it 'shows the my dashboard link if logged in' do
    create_user_and_log_in
    visit home_path
    expect(page).to have_content "My Accounts"
  end

  it 'does not show the dashboard link if not logged in' do
    visit home_path
    expect(page).to_not have_content "My Accounts"
  end

  it 'shows the account name from the account index by user' do
    user = create(:user)
    user2 = User.create(name: "Aaron", email: 'rock@solid.com', password: 'rockmyworld')
    account = create(:account)
    account2 = create(:account, name: 'Savings')
    user.accounts << account
    user2.accounts << account2

    page.set_rack_session("warden.user.user.key" => User.serialize_into_session(user).unshift("User"))
    visit accounts_path

    expect(page).to have_content account.name
    expect(page).to_not have_content account2.name
  end

  it 'can create an account associated with the user' do
    create_user_and_log_in
    visit accounts_path
    click_link_or_button "Create New Account"
    fill_in 'account_name', with: 'Checking'
    click_link_or_button "Submit"
    expect(current_path).to eq accounts_path
    expect(page).to have_content "Checking"
  end
end
