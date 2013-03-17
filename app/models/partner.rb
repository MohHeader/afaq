class Partner < ActiveRecord::Base
  attr_accessible :name, :tower_id
  belongs_to :tower
  has_many :units
end
