# == Schema Information
#
# Table name: breweries
#
#  id         :bigint           not null, primary key
#  name       :string
#  verified   :boolean          default(FALSE)
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe 'Database' do
    subject(:brewery) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:verified).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:image_url).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:beers).dependent(:destroy) }
  end
end
