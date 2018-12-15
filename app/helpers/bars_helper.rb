module BarsHelper

  def manager_has_one_bar 
    if current_manager.bar
      redirect_to root_path
    end 
  end 

  def manager_can_only_edit_their_bar 
    if current_manager.bar.id != params[:id].to_i
      redirect_to edit_managers_bar_path(current_manager.bar.id), alert: "Vous n'avez pas accès à cette page"
    end 
  end 

  def address_or_name_blank
    params[:bar][:address].blank? || params[:bar][:name].blank?
  end 

end
