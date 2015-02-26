class Account < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  has_many :envelopes
  after_update :disperse_envelopes if :balance_changed?

  def make_deposit(amount)
    self.balance += amount
  end

  def make_withdrawal(amount)
    self.balance -= amount
  end
  private

  def disperse_envelopes
    envelopes.each do |envelope|
      if envelope.percentage_zero?
        envelope.balance += envelope.budgeted_amount
      end
    end
  end
end
