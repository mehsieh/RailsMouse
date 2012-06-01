class HomeController < ApplicationController
  
  def index
    @snp_positions = SnpPosition.all
    @strain_list = Strain.distinct.all
    @strains = Strain.all
  end


end