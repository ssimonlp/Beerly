require 'rails_helper'

RSpec.describe FavBeer, type: :model do

  before do 
    @user = User.new(email: "user@gmail.com", password: "123456", password_confirmation: "123456")
    @user.skip_confirmation!
    @user.save      
    @beerwishlist = BeerWishlist.create!(user_id: @user.id)
    BarWishlist.create!(bar_id: 1, user_id: @user.id)
    BarWishlist.create!(bar_id: 2, user_id: @user.id)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
    FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1)
  end 

  it 'should not allow more than 3 favorited beers' do
    expect{ FavBeer.create!(beer_wishlist_id: @beerwishlist.id, beer_id: rand(Beer.count) + 1) }.to raise_error(ActiveRecord::RecordInvalid)
  end 


end
