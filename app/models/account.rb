class Account < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  has_many :envelopes

  def make_deposit(amount)
    self.balance += amount
  end

  def make_withdrawal(amount)
    self.balance -= amount
  end
end
