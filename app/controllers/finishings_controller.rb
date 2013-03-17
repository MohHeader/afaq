class FinishingsController < ApplicationController
  # GET /finishings
  # GET /finishings.json
  def index
    @finishings = Finishing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finishings }
    end
  end

  # GET /finishings/1
  # GET /finishings/1.json
  def show
    @finishing = Finishing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finishing }
    end
  end

  # GET /finishings/new
  # GET /finishings/new.json
  def new
    @finishing = Finishing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finishing }
    end
  end

  # GET /finishings/1/edit
  def edit
    @finishing = Finishing.find(params[:id])
  end

  # POST /finishings
  # POST /finishings.json
  def create
    @finishing = Finishing.new(params[:finishing])

    respond_to do |format|
      if @finishing.save
        format.html { redirect_to @finishing, notice: 'Finishing was successfully created.' }
        format.json { render json: @finishing, status: :created, location: @finishing }
      else
        format.html { render action: "new" }
        format.json { render json: @finishing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finishings/1
  # PUT /finishings/1.json
  def update
    @finishing = Finishing.find(params[:id])

    respond_to do |format|
      if @finishing.update_attributes(params[:finishing])
        format.html { redirect_to @finishing, notice: 'Finishing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finishing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finishings/1
  # DELETE /finishings/1.json
  def destroy
    @finishing = Finishing.find(params[:id])
    @finishing.destroy

    respond_to do |format|
      format.html { redirect_to finishings_url }
      format.json { head :no_content }
    end
  end
end
