class TowersController < ApplicationController

  def index
    @towers = Tower.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @towers }
    end
  end

  def show
    if params[:tower_select] && params[:tower_select].to_i > 0
      @tower = Tower.find(params[:tower_select])
      redirect_to tower_path(@tower)
    else
      @tower = Tower.find(params[:id])
    end
    
    @partners = @tower.partners
    if params[:partner_filter] && params[:partner_filter].to_i > 0
      @units = @tower.units.where("partner_id = ?", params[:partner_filter])
    else
      @units = @tower.units
    end
    @unit_floors_unsold = @units.unsold(@tower).group_by { |t| t.floor }
    @unit_floors_sold = @units.sold(@tower).group_by { |t| t.floor }

  end

  def new
    @tower = Tower.new
    @tower.units.build
    @tower.partners.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tower }
    end
  end


  def edit
    @tower = Tower.find(params[:id])
    @unit_floors = @tower.units.group_by { |t| t.floor }
  end

  def create
    @tower = Tower.new(params[:tower])    
    if @tower.save
      redirect_to edit_individual_tower_path(@tower)
    else
      render action: "new" 
    end
  end

  def update
    @tower = Tower.find(params[:id])

    respond_to do |format|
      if @tower.update_attributes(params[:tower])
        format.html { redirect_to @tower, notice: 'Tower was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tower.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tower = Tower.find(params[:id])
    @tower.destroy

    respond_to do |format|
      format.html { redirect_to towers_url }
      format.json { head :no_content }
    end
  end
  
  
  def edit_individual
  @tower = Tower.find(params[:id])
  @unit_floors = @tower.units.group_by { |t| t.floor }
    render 'partners_units'
  end

  def update_individual
    @tower = Tower.find(params[:id])

    if Unit.update(params[:units].keys, params[:units].values)
      flash[:notice] = "Units updated"
      redirect_to @tower
    else
      render action: "edit_individual"
    end
  end
end
