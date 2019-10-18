require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_index_url
    assert_response :success
  end

  test "should get fuda" do
    get top_fuda_url
    assert_response :success
  end

  test "should get option" do
    get top_option_url
    assert_response :success
  end

end
