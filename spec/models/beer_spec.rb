# == Schema Information
#
# Table name: beers
#
#  id          :bigint           not null, primary key
#  name        :string
#  image_url   :string
#  description :text
#  abv         :decimal(, )
#  ibu         :decimal(, )
#  verified    :boolean          default(FALSE)
#  category_id :bigint
#  style_id    :bigint
#  brewery_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe 'Database' do
    subject(:beer) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:image_url).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:abv).of_type(:decimal) }
    it { is_expected.to have_db_column(:ibu).of_type(:decimal) }
    it { is_expected.to have_db_column(:verified).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:category_id).of_type(:integer) }
    it { is_expected.to have_db_column(:style_id).of_type(:integer) }
    it { is_expected.to have_db_column(:brewery_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    # 💩 Should be working, need refactoring in model
    # it { is_expected.to have_many(:bars).through(:beer_list) }
    it { is_expected.to have_many(:fav_beers).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:brewery) }
    it { is_expected.to validate_presence_of(:style) }
    it { is_expected.to validate_presence_of(:category) }
  end
end
