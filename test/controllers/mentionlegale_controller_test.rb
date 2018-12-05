require 'test_helper'

class MentionlegaleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mentionlegale_index_url
    assert_response :success
  end

end
