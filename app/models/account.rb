class Account < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  has_many :envelopes
  after_save :disperse_envelopes if :balance_changed?

  private

  def disperse_envelopes
    envelopes.each do |envelope|
      if envelope.percentage_zero?
        envelope.balance += envelope.budgeted_amount
      end
    end
  end

  def percentage_zero?
    budgeted_percentage == 0
  end
end
#I should move this dispersement to another class
#why can't I use after_udpate?
#why isn't the right account showing up in the disperse_envelopes method?
#why doesn't the account have any envelopes associated with it?
