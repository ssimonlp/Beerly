require 'rails_helper'

RSpec.describe BarWishlist, type: :model do

  describe 'relations' do 

    before do 
      @user = User.new(email: "user@gmail.com", password: "123456", password_confirmation: "123456")
      @user.skip_confirmation!
      @user.save   
      @user2 = User.new(email: "user50000@gmail.com", password: "123456", password_confirmation: "123456")
      @user2.skip_confirmation!
      @user2.save   
      @bar_wishlist = BarWishlist.create(bar_id:1,user_id:@user.id)
    end 

    it "assure a bar can't be added twice on a wishlist" do 
      second_bar_wishlist = BarWishlist.new(bar_id:1,user_id:@user.id)
      expect(second_bar_wishlist.valid?).to be_falsy
    end 

    it 'assure a bar can be on different wishlists' do 
      bar_wishlist_2 = BarWishlist.new(bar_id:1, user_id:@user2.id)
      expect(bar_wishlist_2.valid?).to be true 
    end 

    it "has belongs_to user association" do 
      association = BarWishlist.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end 

  end 

end
