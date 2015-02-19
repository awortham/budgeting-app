class Envelope < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :budgeted_percentage
  validates_numericality_of :budgeted_amount
  # validates amount_or_percentage
  belongs_to :account
end
