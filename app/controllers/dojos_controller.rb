class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create
    dojos = Dojo.create(dojo_params)
    if dojos.valid?
      redirect_to '/'
    else
      flash[:errors] = dojos.errors.full_messages
      redirect_to '/dojos/new'
    end
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
