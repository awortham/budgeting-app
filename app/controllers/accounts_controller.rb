class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @account = Account.new
  end

  def index
    @accounts = current_user.accounts
  end

  def create
    account = current_user.accounts.create(account_params)
    if account.valid?
      redirect_to accounts_path
    end
  end

  def show
    @account = current_user.accounts.find(params[:id])
  end

  private
  def account_params
    params.require(:account).permit(:name)
  end
end
