# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    context 'When testing what the user should have' do
      before do
        @user = User.new(email: 'user@gmail.com', password: '123456', password_confirmation: '123456')
        @user.skip_confirmation!
        @user.save
        @beerwishlist = BeerWishlist.create!(user_id: @user.id)
        BarWishlist.create!(bar_id: 1, user_id: @user.id)
        BarWishlist.create!(bar_id: 2, user_id: @user.id)
        FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
        FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
        FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
      end

      it 'should have many bars through their barwishlists' do
        expect { @user.bar }.to raise_error(NoMethodError)
        expect(@user.bars).not_to be_empty
      end

      it 'should have only one beerwishlist' do
        expect { @user.beer_wishlists }.to raise_error(NoMethodError)
      end

      it 'should have beers through their beerwishlists' do
        expect { @user.beer_wishlist.beer }.to raise_error(NoMethodError)
        expect(@user.beer_wishlist.beers).not_to be_empty
      end
    end
  end
end
