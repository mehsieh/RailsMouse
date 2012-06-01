class StrainsController < ApplicationController
  
  def index
    @strains = Strain.active.all
  end

  def show
    @strain = Strain.find(params[:id])
  end

  def new
    @strain = Strain.new
  end

  def edit
    @strain = Strain.find(params[:id])
  end

  def create
    @strain = Strain.new(params[:strain])
    if @strain.save
      # if saved to database
      flash[:notice] = "Successfully created #{@strain.name}."
      redirect_to @strain # go to show strain page
    else
      # return to the 'new' form
      render :action => 'new'
    end
  end

  def update
    @strain = Strain.find(params[:id])
    if @strain.update_attributes(params[:strain])
      flash[:notice] = "Successfully updated #{@strain.name}."
      redirect_to @strain
    else
      render :action => 'edit'
    end
  end

  def destroy
    @strain = Strain.find(params[:id])
    @strain.destroy
    flash[:notice] = "Successfully removed #{@strain.name} from the database."
    redirect_to strains_url
  end
end
