require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get themes_index_url
    assert_response :success
  end

  test "should get new" do
    get themes_new_url
    assert_response :success
  end

end
