class EnvelopesController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
    @envelope = @account.envelopes.new
  end

  def create
    account = current_user.accounts.find(params[:account_id])
    @envelope = account.envelopes.create(envelope_params)
    if @envelope.save
      flash[:notice] = "Envelope Created"
      redirect_to account_path(account)
    else
      flash[:notice] = "Envelope was not Created"
      redirect_to new_account_envelope_path(account)
    end
  end

  def show
    account = current_user.accounts.find(params[:account_id])
    @envelope = account.envelopes.find(params[:id])
  end

  private
  def envelope_params
    params.require(:envelope).permit(:name, :amount, :percentage)
  end
end