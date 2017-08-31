require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_index_url
    assert_response :success
  end

  test "should get new" do
    get item_new_url
    assert_response :success
  end

  test "should get create" do
    get item_create_url
    assert_response :success
  end

  test "should get listing" do
    get item_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get item_pricing_url
    assert_response :success
  end

  test "should get description" do
    get item_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get item_photo_upload_url
    assert_response :success
  end

  test "should get details" do
    get item_details_url
    assert_response :success
  end

  test "should get update" do
    get item_update_url
    assert_response :success
  end

end
