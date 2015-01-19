class AddColumnToEnvelopes < ActiveRecord::Migration
  def change
    add_column :envelopes, :account_id, :string
  end
end
