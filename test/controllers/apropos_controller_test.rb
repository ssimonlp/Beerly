require 'test_helper'

class AproposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apropos_index_url
    assert_response :success
  end

end
