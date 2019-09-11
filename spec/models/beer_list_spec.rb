# == Schema Information
#
# Table name: beer_lists
#
#  id              :bigint           not null, primary key
#  pint_price      :decimal(, )
#  half_pint_price :decimal(, )
#  bottle_price    :decimal(, )
#  beer_id         :bigint
#  bar_id          :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_archived     :boolean          default(FALSE)
#


require 'rails_helper'

RSpec.describe BeerList, type: :model do
  describe 'Database' do
    subject(:beer_list) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:pint_price).of_type(:decimal) }
    it { is_expected.to have_db_column(:half_pint_price).of_type(:decimal) }
    it { is_expected.to have_db_column(:bottle_price).of_type(:decimal) }
    it { is_expected.to have_db_column(:beer_id).of_type(:integer) }
    it { is_expected.to have_db_column(:bar_id).of_type(:integer) }
    it { is_expected.to have_db_column(:is_archived).of_type(:boolean) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:beer) }
    it { is_expected.to belong_to(:bar) }
    it { is_expected.to have_one(:manager) }
  end
end
