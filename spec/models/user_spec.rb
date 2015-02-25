require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = create(:user)
    @account = create(:account)
    @user.accounts << @account
  end

  it 'is valid' do
    expect(@user).to be_valid
  end

  it 'has accounts associated' do
    expect(@user.accounts.first).to eq @account
  end
end
