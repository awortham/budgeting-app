require 'rails_helper'

RSpec.describe Account, :type => :model do
  before do
    @account = create(:account)
  end

  it 'can create an account' do
    expect(@account).to be_valid
  end

  it 'can take an amount of money' do
    expect(@account.balance).to eq(243.68)
  end

  it 'cannot be created without a name' do
    account = Account.new
    expect(account).to_not be_valid
  end

  it 'can be created with a name' do
    account = Account.new(name: "Awesome")
    expect(account).to be_valid
  end
end
