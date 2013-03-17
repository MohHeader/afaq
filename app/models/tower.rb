class Tower < ActiveRecord::Base
  attr_accessible :name, :o_floors, :h_floors, :units_attributes, :partners_attributes
  has_many :units, :dependent => :destroy#, :order => 'updated_at ASC'
  has_many :partners, :dependent => :destroy
  has_many :installments, through: :units
  validates_presence_of :partners, :name
  accepts_nested_attributes_for :units, :allow_destroy => true , :reject_if => lambda { |a| a[:number].blank? }
  accepts_nested_attributes_for :partners, :allow_destroy => true , :reject_if => lambda { |a| a[:name].blank? }
end
