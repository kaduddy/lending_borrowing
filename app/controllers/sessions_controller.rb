class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	lender = Lender.find_by_email(params[:email])
    borrower = Borrower.find_by_email(params[:email])
  	if lender && lender.authenticate(params[:password])
  		session[:lender_id] = lender.id
  		redirect_to "/lenders/#{lender.id}"
    elsif borrower && borrower.authenticate(params[:password])
      session[:borrower_id] = borrower.id
      redirect_to "/borrowers/#{borrower.id}"
  	else
  		flash[:error] = "Invalid"
  		redirect_to "/login"
  	end
  end

  def destroy
    if session[:lender_id]
      session[:lender_id] = nil
    else
      session[:borrower_id] = nil
    end
    redirect_to "/login"
  end
end
