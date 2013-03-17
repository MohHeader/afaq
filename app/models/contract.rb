class Contract < ActiveRecord::Base
  attr_accessible :buyer_name,:buyer_phone, :finishing_id, :seller_id, :total_price, :unit_id, :meter_price, :installments_attributes, :note, :file, :file_cache
  belongs_to :seller
  belongs_to :finishing
  belongs_to :unit
  has_many :installments, :dependent => :destroy, :order => 'date ASC'
  accepts_nested_attributes_for :installments, :reject_if => lambda { |a| a[:amount].blank? }, :allow_destroy => true
  validate :installments_sum
  validates :buyer_phone, :length => { :is => 11 }
  mount_uploader :file, FileUploader

  def installments_sum
    total_installments = self.installments.map{|a| a.amount}.sum#inspect#sum(&:amount)
    errors.add(:base,"اجمالي الاقساط#{total_installments} لا يساوي اجمالي السعر#{self.total_price}") unless total_installments == self.total_price
  end

  def self.allbelongsto(tower)
  regs = []
    @units = Unit.where(tower_id: tower)
    @units.each do |unit|
      regs <<  unit.contract if unit.contract
    end
    regs
  end
  
end
