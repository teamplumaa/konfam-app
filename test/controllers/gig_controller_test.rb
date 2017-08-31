require 'test_helper'

class GigControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gig_index_url
    assert_response :success
  end

  test "should get new" do
    get gig_new_url
    assert_response :success
  end

  test "should get create" do
    get gig_create_url
    assert_response :success
  end

  test "should get listing" do
    get gig_listing_url
    assert_response :success
  end

  test "should get description" do
    get gig_description_url
    assert_response :success
  end

  test "should get logistics" do
    get gig_logistics_url
    assert_response :success
  end

  test "should get compensation" do
    get gig_compensation_url
    assert_response :success
  end

end
