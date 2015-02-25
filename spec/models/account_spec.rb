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

  it 'disperses a deposit into multiple envelopes' do
    a = Account.create(name: 'savings', balance: 0)
    e1 = create(:envelope)
    e2 = create(:envelope, name: "mortgage", budgeted_percentage: 25, budgeted_amount: 0)
    a.envelopes << [e1, e2]

    expect(a.balance).to eq 0
    a.balance += 1000
    a.save
    expect(a.balance).to eq 1000
    expect(e1.balance).to eq 99.99
    expect(e2.balance).to eq 250
  end
end
