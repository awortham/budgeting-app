class CreateEnvelopes < ActiveRecord::Migration
  def change
    create_table :envelopes do |t|
      t.string :name
      t.decimal :amount
      t.decimal :percentage

      t.timestamps
    end
  end
end
