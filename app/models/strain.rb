class Strain < ActiveRecord::Base
  # Relationships
  belongs_to :snp_position
  
  # Validations
  validates_presence_of :name, :snp_position_id, :allele
  validates_uniqueness_of :name
  validates_inclusion_of :allele, :in => %w[T C A G t c a g n N], :message => "is not an option"
  
  # Scopes
  scope :distinct, group(:name)
  scope :alphabetical, order('name')
  scope :search, lambda { |term| where('name LIKE ?', "#{term}%") }
  
  
end
