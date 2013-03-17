class Finishing < ActiveRecord::Base
  attr_accessible :name
  has_many :contracts
end
