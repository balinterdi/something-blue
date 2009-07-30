class LendingsController < ApplicationController
  
  def new
    @lending = Lending.new
    @friends = User.by_login
  end

  def create
    @lending = Lending.new(params[:lending])
    if @lending.save
      flash[:ok] = "Lending saved"
      redirect_to lendings_path
    end
  end
  
  def index
    @lendings = Lending.all
  end
  
end
