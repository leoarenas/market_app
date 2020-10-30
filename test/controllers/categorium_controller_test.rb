require 'test_helper'

class CategoriumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categorium_index_url
    assert_response :success
  end

  test "should get new" do
    get categorium_new_url
    assert_response :success
  end

  test "should get edit" do
    get categorium_edit_url
    assert_response :success
  end

  test "should get create" do
    get categorium_create_url
    assert_response :success
  end

  test "should get update" do
    get categorium_update_url
    assert_response :success
  end

  test "should get destroy" do
    get categorium_destroy_url
    assert_response :success
  end

end
