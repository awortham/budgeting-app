class Envelope < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :budgeted_percentage
  validates_numericality_of :budgeted_amount
  validate :amount_xor_percentage
  belongs_to :account

  private

  def amount_xor_percentage
    if checker.count != 1
      errors.add(:base, "Please specify either amount or percentage but not both.")
    end
  end

  def checker
    columns = [budgeted_amount, budgeted_percentage]
    columns.reduce([]) { |acc, column| acc << column if column > 0; acc }
  end
end
