class InstallmentsController < ApplicationController

  def index
    if params[:tower_select] && params[:tower_select].to_i > 0
      @installments = Tower.find(params[:tower_select]).installments
    elsif params[:id]&& params[:id].to_i > 0
      @installments = Contract.find(params[:id]).installments
      else
      @installments = Installment.order("date")
    end
    @buyers = Contract.find(:all,:conditions => ['buyer_name LIKE ?', "%#{params[:term]}%"], :order => 'buyer_name').map{ |c| {label: c.buyer_name, value: c.id}}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buyers }
    end
  end

  def show
    @installment = Installment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @installment }
    end
  end
   
  def pay
    Installment.find(params[:id]).toggle!('paid')
    redirect_to installments_url
  end
end