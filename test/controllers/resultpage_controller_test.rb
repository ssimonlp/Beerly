# frozen_string_literal: true

require 'test_helper'

class ResultpageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get resultpage_index_url
    assert_response :success
  end
end
