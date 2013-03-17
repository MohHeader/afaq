class Unit < ActiveRecord::Base
  attr_accessible :number, :tower_id, :floor, :standard_price, :unit_type, :partner_id, :code, :u_type
  attr_accessor :unit_type, :code
  belongs_to :tower
  belongs_to :partner
  has_many :installments, through: :contract
  has_one :contract, :dependent => :destroy

  #default_scope :order => 'code'
  
  before_create :unit_renumber
  
  def self.unsold(tower)
    regs = []
    
    @units = Unit.where(u_type: "down").where(tower_id: tower).order("floor, number")
    @units.each do |unit|
      regs <<  unit unless unit.contract
    end  
    @units = Unit.where(u_type: "up").where(tower_id: tower).order("floor * 1, number")
    @units.each do |unit|
      regs <<  unit unless unit.contract
    end
    regs
  end
  
  def self.sold(tower)
    regs = []
    @units = Unit.where(u_type: "down").where(tower_id: tower).order("floor, number")
    @units.each do |unit|
      regs <<  unit if unit.contract
    end  
    @units = Unit.where(u_type: "up").where(tower_id: tower).order("floor * 1, number")
    @units.each do |unit|
      regs <<  unit if unit.contract
    end
    regs
  end

  def code
    n = sprintf '%02d', self.number if self.number
    if self.floor
      f = self.floor
      c = f + n
    else
     c = n 
    end
    c
  end
  
  private
  def unit_renumber
    if self.unit_type == "store"
      self.floor = "A"
      self.u_type = "down" 
    elsif self.unit_type == "office"
      abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","T"]
      i = 1
      t_id = self.tower.id
      floors = self.tower.o_floors.to_i - 1
      floors.times do
        Unit.create(number: self.number, floor: abc[i],tower_id: t_id, standard_price: self.standard_price, u_type: "down")
        i += 1
      end
      self.floor = abc[i]
      self.u_type = "down"
    elsif self.unit_type == "home"
      i = 1
      t_id = self.tower.id
      floors = self.tower.h_floors.to_i - 1
      floors.times do
        Unit.create(number: self.number, floor: i,tower_id: t_id, standard_price: self.standard_price, u_type: "up")
        i += 1
      end
      self.floor = i
      self.u_type = "up" 
    end
  end

end