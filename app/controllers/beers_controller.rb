class BeersController < ApplicationController
  
  def index
    @beers = Beers.all 
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    if current_manager
      @beer = Beer.new
    else 
    redirect_to root_path
    end 
  end

  def create
    @beer = Beer.create(beer_params)
    redirect_to edit_manager_bar_path(@bar.id)
  end

  def update
    @bar = Bar.find(bar_params)
    @bar.update(bar_params)
    redirect_to bar_path(@bar.id)
  end

  def edit
    if current_manager.bar.id != params[:id].to_i
      redirect_to root_path
    else 
      @bar = Bar.find(current_manager.bar.id)
    end  
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy 
    redirect_to bar_path
  end

  private 
    def beer_params
      params.require(:bar).permit(:name, :address, :photo, :opening_time, :happy_hours, :description)
    end 
end
