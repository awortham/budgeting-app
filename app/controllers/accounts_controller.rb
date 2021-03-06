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
    @account = find_account(params[:id])
  end

  def edit
    @account = find_account(params[:id])
  end

  def update
    account = find_account(params[:id])
    account.assign_attributes(account_params)
    if account.save
      flash[:notice] = 'You have updated your Account'
      redirect_to accounts_path
    else
      flash[:notice] = 'Oops! Something went wrong and we were not able to save the updated information'
      redirect_to :back
    end
  end

  def deposit
    account = find_account(params[:id])
    account.make_deposit(balance_params)
    if account.save
      redirect_to account_path(account)
    else
      redirect_to :back
    end
  end

  def withdrawal
    account = find_account(params[:id])
    account.make_withdrawal(balance_params)
    if account.save
      redirect_to account_path(account)
    else
      redirect_to :back
    end
  end

  private

  def balance_params
    params[:account][:balance].to_d
  end

  def find_account(id)
    current_user.accounts.find(id)
  end

  def account_params
    params.require(:account).permit(:name)
  end
end
