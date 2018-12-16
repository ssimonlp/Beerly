require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beers_new_url
    assert_response :success
  end

  test "should get create" do
    get beers_create_url
    assert_response :success
  end

  test "should get index" do
    get beers_index_url
    assert_response :success
  end

  test "should get edit" do
    get beers_edit_url
    assert_response :success
  end

  test "should get update" do
    get beers_update_url
    assert_response :success
  end

  test "should get show" do
    get beers_show_url
    assert_response :success
  end

  test "should get destroy" do
    get beers_destroy_url
    assert_response :success
  end

end
