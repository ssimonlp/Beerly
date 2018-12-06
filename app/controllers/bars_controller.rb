class BarsController < ApplicationController
  def index
    @bars = Bar.all 
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new 
  end

  def create
    @bar = Bar.create(manager_id: current_manager.id)
    redirect_to edit_manager_bar_path(@current_manager.id, @bar.id)
  end

  def update
    @bar = Bar.find(bar_params)
    @bar.update(bar_params)
    redirect_to bar_path(@bar.id)
  end
  def edit
    @bar = Bar.find(params[:id])
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
