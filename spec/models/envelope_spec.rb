require 'rails_helper'

RSpec.describe Envelope, :type => :model do
  describe 'creating an envelope' do
    it 'can create an envelope' do
      envelope = create(:envelope)
      expect(envelope).to be_valid
    end

    it 'cannot create an envelope without a name' do
      envelope = Envelope.new
      expect(envelope).to_not be_valid
    end

    it 'can create an envelope with a name' do
      envelope = Envelope.new(name: "Truck Fund", budgeted_amount: 20.00)
      expect(envelope).to be_valid
    end

    it 'budgeted percentage cannot be other than a number' do
      e = Envelope.new(name: "Truck Fund", budgeted_percentage: 20.00)
      e2 = Envelope.new(name: "Truck Fund", budgeted_percentage: "fatty cheeses")
      expect(e).to be_valid
      expect(e2).to_not be_valid
    end

    it 'budgeted amount cannot be other than a number' do
      e = Envelope.new(name: "Truck Fund", budgeted_amount: 20.00)
      e2 = Envelope.new(name: "Truck Fund", budgeted_amount: "fatty cheeses")
      expect(e).to be_valid
      expect(e2).to_not be_valid
    end

    it 'requires either amount or percentage' do
      e = Envelope.new(name: "Truck Fund")
      expect(e).to_not be_valid
      e2 = Envelope.new(name: "Truck Fund", budgeted_amount: 20)
      expect(e2).to be_valid
      e3 = Envelope.new(name: "Truck Fund", budgeted_percentage: 0.20)
      expect(e3).to be_valid
    end

    it 'does not create envelope with both percentage and amount' do
      e = Envelope.new(name: "Truck Fund", budgeted_percentage: 0.20, budgeted_amount: 20)
      expect(e).to_not be_valid
    end

    it 'has a max amount column' do
      e = create(:envelope, max: 50)
      expect(e).to be_valid
    end

    it 'balance cannot exceed the max amount column' do
    end
  end
end
