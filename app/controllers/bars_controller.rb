class BarsController < ApplicationController

  def index
    @bars = Bar.all 
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    if current_manager.bar.id != nil
      redirect_to root_path
    else 
    @bar = Bar.new 
    end 
  end

  def create
    @bar = Bar.create(manager_id: current_manager.id)
    redirect_to edit_manager_bar_path(@bar.id)
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to bar_path(@bar.id)
  end

  def edit
    if current_manager.bar.id != params[:id].to_i
      redirect_to root_path
    else 
      @bar = Bar.find(current_manager.bar.id)
      @draft_beers = @bar.beer_lists.where(bottle_price: nil)
      @bottle_beers = @bar.beer_lists.where(pint_price: nil)
      @beers = Beer.where(verified: true) 
    end  
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy 
    redirect_to bar_path
  end

  private 
    def bar_params
      params.require(:bar).permit(:name, :address, :photo, :opening_time, :happy_hours, :description)
    end 

end