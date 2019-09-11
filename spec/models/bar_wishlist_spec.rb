# == Schema Information
#
# Table name: bar_wishlists
#
#  id         :bigint           not null, primary key
#  bar_id     :bigint
#  user_id    :bigint
#  is_visited :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BarWishlist, type: :model do
  describe 'Database' do
    subject(:bar_wishlist) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:bar_id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:is_visited).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:bar) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:bar_id) }
    # 💩 Should work, to investigate
    # it { is_expected.to validate_uniqueness_of(:bar_id).scoped_to(:user_id) }
  end
end
