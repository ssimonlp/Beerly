# == Schema Information
#
# Table name: bars
#
#  id           :bigint           not null, primary key
#  manager_id   :bigint
#  name         :string
#  address      :text
#  photo        :string
#  opening_time :text
#  happy_hours  :text
#  description  :text
#  latitude     :float
#  longitude    :float
#  state        :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  siret        :decimal(14, )
#

require 'rails_helper'

RSpec.describe Bar, type: :model do
  describe 'Database' do
    subject(:bar) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:text) }
    it { is_expected.to have_db_column(:photo).of_type(:string) }
    it { is_expected.to have_db_column(:opening_time).of_type(:text) }
    it { is_expected.to have_db_column(:happy_hours).of_type(:text) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:latitude).of_type(:float) }
    it { is_expected.to have_db_column(:longitude).of_type(:float) }
    it { is_expected.to have_db_column(:state).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:siret).of_type(:decimal) }
    it { is_expected.to have_db_column(:manager_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:manager) }
    it { is_expected.to have_many(:beer_lists).dependent(:destroy) }
    it { is_expected.to have_many(:beers).through(:beer_lists) }
    it { is_expected.to have_many(:bar_wishlists).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:siret) }
  end
end
