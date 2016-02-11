class LendersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @lender = Lender.create(lender_params)
    if @lender.valid? == false
      flash[:error] = "Invalid"
      redirect_to '/registration'
    else
      redirect_to "/login"
    end
  end

  def show
    @lender = Lender.find(params[:id])
    @people = Borrower.all
    @borrowers = History.where(lender_id: params[:id])
    # render :json =>
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def lender_params
    params.require(:lender).permit(:f_name, :l_name, :email, :password, :money)
  end

end
