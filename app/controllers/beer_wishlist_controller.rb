# frozen_string_literal: true

class BeerWishlistController < ApplicationController
  before_action :check_wishlist

  def show
    @beer_wishlist = BeerWishlist.find_by(user_id: current_user.id)
  end

  private

  def check_wishlist
    if BeerWishlist.find_by(user_id: current_user.id).nil?
      BeerWishlist.create(user_id: current_user.id)
    end
  end

  def manager_can_only_edit_their_beerlists
    unless current_manager.bar.id = BeerList.find(params[:id].to_i).manager.id
      redirect_to managers_beer_lists_path, alert: 'Vous ne pouvez pas modifier cette bière'
    end
  end

  def no_blank_price
    (!params[:beer_list][:pint_price].blank? && !params[:beer_list][:half_pint_price].blank?) || !params[:beer_list][:bottle_price].blank?
  end

  def try_to_enter_draft
    (!params[:beer_list][:pint_price].blank? && !params[:beer_list][:half_pint_price].blank?)
  end

  def has_already_this_beer_in_draft
    !current_manager.beer_lists.draft.where(beer_id: (params[:beer_list][:beer_id]).to_i).empty?
  end

  def try_to_enter_bottle
    !params[:beer_list][:bottle_price].blank?
  end

  def has_already_this_beer_in_bottle
    !current_manager.beer_lists.bottle.where(beer_id: (params[:beer_list][:beer_id]).to_i).empty?
  end
end
