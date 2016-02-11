class HistoriesController < ApplicationController
  def create
  	@lender = Lender.find(params[:lender_id])
	@borrower = Borrower.find(params[:borrower_id])
  	if @lender.money - params[:amount].to_i < 0
  		flash[:error] = "INSUFFICIENT FUNDS"
  		redirect_to "/lenders/#{session[:lender_id]}"
  	elsif History.exists?(lender_id: params[:lender_id], borrower_id: params[:borrower_id]) == true
  		@check = History.find_by(lender_id: params[:lender_id], borrower_id: params[:borrower_id])
  		@lender.update(money: @lender.money -= params[:amount].to_i)
	  	@borrower.update(money: @borrower.money -= params[:amount].to_i, raised: @borrower.raised += params[:amount].to_i)
	  	@check.update(amount: @check.amount += params[:amount].to_i)
	  	redirect_to "/lenders/#{session[:lender_id]}"
  	else
  		@history = History.create(lender_id: params[:lender_id], borrower_id: params[:borrower_id], amount: params[:amount])
	  	@lender.update(money: @lender.money -= params[:amount].to_i)
	  	@borrower.update(money: @borrower.money -= params[:amount].to_i, raised: @borrower.raised += params[:amount].to_i)
	  	redirect_to "/lenders/#{session[:lender_id]}"
	end
  end
end
