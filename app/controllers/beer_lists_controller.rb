# frozen_string_literal: true

class BeerListsController < ApplicationController
  before_action :manager_can_only_edit_their_beerlists, only: [:edit]

  def new
    @beerlist = BeerList.new
  end

  def index
    @bar = Bar.find(current_manager.bar.id)
    @draft_beers = @bar.beer_lists.draft.up
    @bottle_beers = @bar.beer_lists.bottle.up
    @beers = Beer.search(params[:term])
    @beerlist = BeerList.new
    @draft_archived_beers = @bar.beer_lists.draft.archived
    @bottle_archived_beers = @bar.beer_lists.bottle.archived
  end

  def create
    if try_to_enter_draft && already_this_beer_in_draft?
      redirect_to managers_beer_lists_path, alert: 'Attention: cette bière est déjà sur votre carte !'
    elsif try_to_enter_bottle && already_this_beer_in_bottle?
      redirect_to managers_beer_lists_path, alert: 'Attention: cette bière est déjà sur votre carte !'
    elsif no_blank_price
      @beerlist = current_manager.bar.beer_lists.create(beerlist_params)
      redirect_to managers_beer_lists_path
    else
      redirect_to managers_beer_lists_path, alert: 'Attention: vous avez oublié un prix !'
    end
  end

  def edit
    @beerlist = BeerList.find(params[:id])
  end

  def update
    @beerlist = BeerList.find(params[:id])
    if no_blank_price
      @beerlist.update(beerlist_params)
      redirect_to managers_beer_lists_path
    else
      redirect_to edit_managers_beer_list_path(@beerlist.id), alert: 'Attention: vous avez oublié un prix !'
    end
  end

  def destroy
    @beerlist = BeerList.find(params[:id])
    @beerlist.destroy
    redirect_to managers_beer_lists_path
  end

  def archive
    @beerlist = BeerList.find(params[:id])
    if @beerlist.is_archived?
      @beerlist.update(is_archived: false)
    else
      @beerlist.update(is_archived: true)
    end
    redirect_to managers_beer_lists_path
  end

  private

  def beerlist_params
    params.require(:beer_list).permit(:beer_id, :pint_price, :half_pint_price, :bottle_price)
  end

  def manager_can_only_edit_their_beerlists
    redirect_to managers_beer_lists_path, alert: 'Vous ne pouvez pas modifier cette bière' unless current_manager.bar.id = BeerList.find(params[:id].to_i).manager.id
  end

  def no_blank_price
    (params[:beer_list][:pint_price].present? && params[:beer_list][:half_pint_price].present?) || params[:beer_list][:bottle_price].present?
  end

  def try_to_enter_draft
    (params[:beer_list][:pint_price].present? && params[:beer_list][:half_pint_price].present?)
  end

  def already_this_beer_in_draft?
    current_manager.beer_lists.draft.where(beer_id: (params[:beer_list][:beer_id]).to_i).present?
  end

  def try_to_enter_bottle
    params[:beer_list][:bottle_price].present?
  end

  def already_this_beer_in_bottle?
    current_manager.beer_lists.bottle.where(beer_id: (params[:beer_list][:beer_id]).to_i).present?
  end
end
