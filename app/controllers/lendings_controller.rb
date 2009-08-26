class LendingsController < ApplicationController
  
  def new
    @lending = Lending.new
    @friends = User.all
  end

  def create
    @lending = Lending.new(params[:lending])
    if @lending.save
      flash[:ok] = "Lending saved"
      redirect_to lendings_path
    else
      flash[:error] = "Lending could not be saved."
      @friends = User.all
      render :action => :new
    end
  end
  
  def index
    @lendings = current_user.lent_items
  end
  
  def overdue
    @lendings = Lending.overdue
  end
  
  def borrowed
    @users_and_loans = Lending.borrowed_by_user
  end
  
end
