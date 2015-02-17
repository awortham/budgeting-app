class AddColumnToEnvelope < ActiveRecord::Migration
  def change
    add_column :envelopes, :balance, :decimal, default: 0.00
  end
end
