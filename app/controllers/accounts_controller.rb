class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def index
    @accounts = current_user.accounts
  end

  def create

    redirect_to accounts_path(current_user)
  end
end
