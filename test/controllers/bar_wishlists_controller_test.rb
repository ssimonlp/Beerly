# frozen_string_literal: true

require 'test_helper'

class BarWishlistsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bar_wishlists_index_url
    assert_response :success
  end
end
