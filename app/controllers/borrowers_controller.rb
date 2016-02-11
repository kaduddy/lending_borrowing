class BorrowersController < ApplicationController
  def create
  	@borrower = Borrower.create(borrower_params)
  	redirect_to "/login"
  end

  def show
  	@borrower = Borrower.find(params[:id])
  	# @lenders = Borrower.find(params[:id]).donations
  	@lenders = History.where(borrower_id: params[:id])
  end

  def edit
  end

  def update
  end

  private
  def borrower_params
  	params.require(:borrower).permit(:f_name, :l_name, :email, :password, :purpose, :description, :money, :raised)
  end
end
