class AddColumnsToEnvelopes < ActiveRecord::Migration
  def change
    add_column :envelopes, :budgeted_amount, :decimal, default: 0.00
    add_column :envelopes, :budgeted_percentage, :decimal, default: 0.00
  end
end
