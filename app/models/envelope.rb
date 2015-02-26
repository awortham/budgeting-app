class Envelope < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :budgeted_percentage
  validates_numericality_of :budgeted_amount
  validates_numericality_of :balance
  validate :amount_or_percentage
  validate :max, numericality: true, allow_nil: true
  before_save :balance_less_than_max
  belongs_to :account

  private

  def balance_less_than_max
    if self.max? && self.balance > self.max
      difference = self.balance - self.max
      self.balance -= difference
    end
  end

  def max_to_integer
    self.max.to_i
  end

  def max_amount
    self.max.to_f
  end

  def amount_or_percentage
    if checker.count != 1
      errors.add(:notice, "Please specify either amount or percentage but not both.")
    else
      return true
    end
  end

  def checker
    columns = [budgeted_amount, budgeted_percentage]
    columns.reduce([]) { |acc, column| acc << column if column > 0; acc }
  end
end
