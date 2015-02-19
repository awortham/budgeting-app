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

  def edit
    @account = current_user.accounts.find(params[:id])
  end

  def update
    account = current_user.accounts.find(params[:id])
    account.assign_attributes(account_params)
    if account.save
      flash[:notice] = 'You have updated your Account'
      redirect_to accounts_path
    else
      flash[:notice] = 'Oops! Something went wrong and we were not able to save the updated information'
      redirect_to :back
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end
end
