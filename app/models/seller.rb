class Seller < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  has_many :contracts
end
