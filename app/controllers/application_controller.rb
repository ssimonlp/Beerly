class ApplicationController < ActionController::Base

  private
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
      

