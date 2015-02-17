class AddColumnsToEnvelopes < ActiveRecord::Migration
  def change
    add_column :envelopes, :amount, :decimal, default: 0.00
    add_column :envelopes, :percentage, :decimal, default: 0.00
  end
end
