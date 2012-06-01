class SnpPositionController < ApplicationController

  def index
    @snp_positions = Snp_position.all
  end

  def show
    @snp_positions = Snp_position.find(params[:id])
  end

  def new
    @snp_position = Snp_position.new
  end

  def edit
    @snp_position = Snp_position.find(params[:id])
  end

  def create
    @snp_position = Snp_position.new(params[:snp_position])
    if @snp_position.save
      # if saved to database
      flash[:notice] = "Successfully created #{@snp_position.snp_id}."
      redirect_to @snp_position # go to show snp_position page
    else
      # return to the 'new' form
      render :action => 'new'
    end
  end

  def update
    @snp_position = Snp_position.find(params[:id])
    authorize! :update, @snp_position
    if @snp_position.update_attributes(params[:snp_position])
      flash[:notice] = "Successfully updated #{@snp_position.snp_id}."
      redirect_to @snp_position
    else
      render :action => 'edit'
    end
  end

  def destroy
    @snp_position = Snp_position.find(params[:id])
    @snp_position.destroy
    flash[:notice] = "Successfully removed #{@snp_position.snp_id} from the database."
    redirect_to snp_positions_url
  end
end
