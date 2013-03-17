class Installment < ActiveRecord::Base
  attr_accessible :amount, :date, :paid, :contract_id
  belongs_to :contract
end
