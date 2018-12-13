require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'relations' do 

    context "When testing what the user should have" do 
    
      before do 
        @user = User.last
      end 
      
      it 'should have many bars through their barwishlists' do 
        expect { @user.bar }.to raise_error(NoMethodError)
        expect(@user.bars).not_to be_empty
      end 

      it 'should have many favorited beers through their beerwishlists' do 
        expect { @user.fav_beer }.to raise_error(NoMethodError)
        expect(@user.fav_beers).not_to be_empty
      end 

    end 

  end

end
