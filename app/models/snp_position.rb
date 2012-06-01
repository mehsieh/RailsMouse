class SnpPosition < ActiveRecord::Base
  
  # Relationships
  has_many :strains
  
  # Validations
  validates_presence_of :snp_id, :position, :strain_id, :chromosome, :allele
  validates_numericality_of :chromosome, :only_integer => true, :greater_than => 0, :less_than => 21
  
  # scopes
  scope :for_chromosome, lambda {|chromosome| where("chromosome = ?", chromosome) }
  scope :between_positions, lambda {|x,y| where('position BETWEEN ? AND ?', x, y) }
  scope :search, lambda { |term| where('snp_id LIKE ?', "#{term}%") }
  
end
