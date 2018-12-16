# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FavBeer, type: :model do
  before do
    @user = User.new(email: 'user@gmail.com', password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    @beerwishlist = BeerWishlist.create!(user_id: @user.id)
<<<<<<< HEAD
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: 1)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: 2)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: 3)
  end 

  it 'should not allow more than 3 favorited beers' do
    expect{ FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1) }.to raise_error(ActiveRecord::RecordInvalid)
  end 

  it "can't have the same beer in their wishlist" do 
    fav_beer_3 = FavBeer.new(beer_wishlist_id: @beerwishlist.id, beer_id: 3)
    expect(fav_beer_3.valid?).to be_falsy
  end 


=======
    BarWishlist.create!(bar_id: 1, user_id: @user.id)
    BarWishlist.create!(bar_id: 2, user_id: @user.id)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
  end

  it 'should not allow more than 3 favorited beers' do
    expect { FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1) }.to raise_error(ActiveRecord::RecordInvalid)
  end
>>>>>>> dev
end
