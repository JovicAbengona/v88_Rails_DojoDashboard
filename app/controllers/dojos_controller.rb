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

  def show
    @dojo = Dojo.find(params[:id])
    @students = @dojo.students
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    dojo = Dojo.find(params[:id])
    dojo.update(dojo_params)
    if dojo.valid?
      redirect_to "/dojos/#{params[:id]}"
    else
      flash[:errors] = dojo.errors.full_messages
      redirect_to "/dojos/#{params[:id]}/edit"
    end
  end

  def delete
    Dojo.find(params[:id]).destroy
    redirect_to "/"
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
