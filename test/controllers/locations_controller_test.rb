require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { about: @location.about, accept_takeout: @location.accept_takeout, contact_email: @location.contact_email, facebook: @location.facebook, instagram: @location.instagram, restaurant_address: @location.restaurant_address, restaurant_name: @location.restaurant_name, restaurant_phone_number: @location.restaurant_phone_number, website: @location.website }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { about: @location.about, accept_takeout: @location.accept_takeout, contact_email: @location.contact_email, facebook: @location.facebook, instagram: @location.instagram, restaurant_address: @location.restaurant_address, restaurant_name: @location.restaurant_name, restaurant_phone_number: @location.restaurant_phone_number, website: @location.website }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
