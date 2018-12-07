class BarsController < ApplicationController

  before_action :manager_has_one_bar, only: [:new]
  before_action :manager_can_only_edit_their_bar, only: [:edit]

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
    redirect_to edit_manager_bar_path(@bar.id)
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    redirect_to bar_path(@bar.id)
  end

  def edit
    @bar = Bar.find(current_manager.bar.id)
    @draft_beers = @bar.beer_lists.draft
    @bottle_beers = @bar.beer_lists.bottle
    @beerlist = BeerList.new 
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

    def manager_has_one_bar 
      if current_manager.bar
        redirect_to root_path
      end 
    end 

    def manager_can_only_edit_their_bar 
      if current_manager.bar.id != params[:id].to_i
        redirect_to root_path
      end 
    end 

end