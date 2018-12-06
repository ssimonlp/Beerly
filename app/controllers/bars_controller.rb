class BarsController < ApplicationController
 
  before_action: current_bar 
 
  def index
    @bars = Bar.all 
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def new
    @bar = Bar.new 
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

    def current_bar
      if current_manager && session[:bar_id]
        bar = Bar.find_by(id: session[:bar_id])
           if bar.present?
             @current_bar = bar 
            else session[:bar_id] = nil 
            end 
      end 

      if session[:bar_id] == nil && current_manager 
        @current_bar = Bar.create(manager_id: current_manager.id)
        sesssion[:bar_id] = @current_bar.id 
      end 
    end 
      
end
