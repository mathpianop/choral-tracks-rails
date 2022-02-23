require 'test_helper'

class ChoirsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get choirs_index_url
    assert_response :success
  end

  test "should get show" do
    get choirs_show_url
    assert_response :success
  end

  test "should get create" do
    get choirs_create_url
    assert_response :success
  end

  test "should get update" do
    get choirs_update_url
    assert_response :success
  end

end
