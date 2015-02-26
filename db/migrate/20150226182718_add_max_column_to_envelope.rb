class AddMaxColumnToEnvelope < ActiveRecord::Migration
  def change
    add_column :envelopes, :max, :decimal
  end
end
