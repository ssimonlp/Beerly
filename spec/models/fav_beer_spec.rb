# == Schema Information
#
# Table name: fav_beers
#
#  id               :bigint           not null, primary key
#  beer_wishlist_id :bigint
#  beer_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#


require 'rails_helper'

RSpec.describe FavBeer, type: :model do
  describe 'Database' do
    subject(:fav_beer) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:beer_wishlist_id).of_type(:integer) }
    it { is_expected.to have_db_column(:beer_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:beer) }
    it { is_expected.to belong_to(:beer_wishlist) }
  end
end
