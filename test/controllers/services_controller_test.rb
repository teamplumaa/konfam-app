require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get services_index_url
    assert_response :success
  end

  test "should get new" do
    get services_new_url
    assert_response :success
  end

  test "should get create" do
    get services_create_url
    assert_response :success
  end

  test "should get listing" do
    get services_listing_url
    assert_response :success
  end

  test "should get description" do
    get services_description_url
    assert_response :success
  end

  test "should get pricing" do
    get services_pricing_url
    assert_response :success
  end

  test "should get photo_uploads" do
    get services_photo_uploads_url
    assert_response :success
  end

  test "should get details" do
    get services_details_url
    assert_response :success
  end

  test "should get update" do
    get services_update_url
    assert_response :success
  end

end
