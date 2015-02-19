require 'rails_helper'

describe 'envelope actions' do
  describe 'editing an envelope' do
    it 'can edit an envelope' do
      create_and_assign_relationships
      expect(@envelope.name).to eq("Truck Fund")
      expect(@envelope.budgeted_amount.to_f).to eq(99.99)
      visit account_envelope_path(@account, @envelope)
      click_link_or_button("Edit Envelope")
      fill_in :envelope_name, with: "Mortgage"
      fill_in :envelope_budgeted_amount, with: 400
      click_link_or_button("Submit Changes")
      expect(current_path).to eq(account_envelope_path(@account, @envelope))
      expect(page).to have_content("Mortgage")
    end
  end

  def create_and_assign_relationships
    @user = create(:user)
    page.set_rack_session("warden.user.user.key" => User.serialize_into_session(@user).unshift("User"))
    @account = create(:account)
    @envelope = create(:envelope)
    @user.accounts << @account
    @account.envelopes << @envelope
  end
end
