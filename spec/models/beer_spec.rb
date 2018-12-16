require 'rails_helper'

RSpec.describe Beer, type: :model do

  describe 'Validations' do 

    context "when creating a beer" do 
    
      it 'should not create a beer without a category_id' do
        beer = Beer.new(name: "La Chouffe", image_url: "https://brewerydb-images.s3.amazonaws.com/beer/LTLdF5/upload_kreIEw-icon.png", description: "La Chouffe is an unfiltered blonde beer, which is re-fermented in the bottle as well as in the keg.  It is pleasantly fruity, spiced with coriander, and with a light hop taste.", abv: 0.8e1, ibu: nil, verified: false, style_id: 63, brewery_id: 0)
        expect(beer.valid?).to be_falsy
      end

      it 'should not create a beer without a style_id' do
        beer = Beer.new(name: "La Chouffe", image_url: "https://brewerydb-images.s3.amazonaws.com/beer/LTLdF5/upload_kreIEw-icon.png", description: "La Chouffe is an unfiltered blonde beer, which is re-fermented in the bottle as well as in the keg.  It is pleasantly fruity, spiced with coriander, and with a light hop taste.", abv: 0.8e1, ibu: nil, verified: false, category_id: 5, brewery_id: 0)
        expect(beer.valid?).to be_falsy
      end

      it 'should not create a beer without a brewery_id' do
        beer = Beer.new(name: "La Chouffe", image_url: "https://brewerydb-images.s3.amazonaws.com/beer/LTLdF5/upload_kreIEw-icon.png", description: "La Chouffe is an unfiltered blonde beer, which is re-fermented in the bottle as well as in the keg.  It is pleasantly fruity, spiced with coriander, and with a light hop taste.", abv: 0.8e1, ibu: nil, verified: false, category_id: 5, style_id: 63)
        expect(beer.valid?).to be_falsy
      end

      it "has belongs_to brewery association" do 
        association = Beer.reflect_on_association(:brewery)
        expect(association.macro).to eq(:belongs_to)
      end 

      it "has belongs_to style association" do 
        association = Beer.reflect_on_association(:style)
        expect(association.macro).to eq(:belongs_to)
      end 

      it "has belongs_to category association" do 
        association = Beer.reflect_on_association(:category)
        expect(association.macro).to eq(:belongs_to)
      end 


    end
  end



end
