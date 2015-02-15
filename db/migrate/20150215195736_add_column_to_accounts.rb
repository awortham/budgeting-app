class AddColumnToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :balance, :decimal, :default => 0.00
  end
end
