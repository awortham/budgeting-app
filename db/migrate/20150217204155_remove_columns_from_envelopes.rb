class RemoveColumnsFromEnvelopes < ActiveRecord::Migration
  def change
    remove_column :envelopes, :amount, :string
    remove_column :envelopes, :percentage, :string
  end
end
