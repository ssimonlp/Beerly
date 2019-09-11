# == Schema Information
#
# Table name: beer_wishlists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BeerWishlist, type: :model do
  describe 'Database' do
    subject(:beer_wishlist) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:fav_beers).dependent(:destroy) }
    it { is_expected.to have_many(:beers).through(:fav_beers) }
  end

   describe 'Validations' do
    # 💩 Should work, to investigate
    # it { is_expected.to validate_length_of(:fav_beers).is_at_most(2) }
  end
end
