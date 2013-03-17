class ContractsController < ApplicationController
  before_filter :inits
  
  def inits
    @tower = Tower.find(params[:tower_id]) if params[:tower_id] 
    @seller = Seller.all
    @finishing = Finishing.all
  end
  
  # GET /contracts
  # GET /contracts.json
  def index

    @units = Unit.where(tower_id: params[:tower_id])
    @contracts = Contract.allbelongsto(params[:tower_id])
  end
  
  def showall
    @contracts = Contract.all
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
    @installments = @contract.installments.order("date")

  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    if Tower.all.count == 0
      redirect_to towers_url, notice: "Add your First Tower"
    end
    @tower = Tower.first unless @tower
    @contract = Contract.new
    @units = Unit.unsold(@tower)
    @contract.installments.build
  end

  # GET /contracts/1/edit
  def edit
    @units = Unit.unsold(params[:tower_id])
    @contract = Contract.find(params[:id])
    @units << @contract.unit
    #@edit = true
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    @units = Unit.unsold(params[:tower_id])
    
    respond_to do |format|
      if @contract.save
        format.html { redirect_to tower_contracts_path(@tower), notice: 'Contract was successfully created.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])
    @units = Unit.unsold(params[:tower_id])
    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to tower_contract_path(@contract.unit.tower, @contract), notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to tower_contracts_path(@tower) }
      format.json { head :no_content }
    end
  end
end