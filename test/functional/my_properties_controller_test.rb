require 'test_helper'

class MyPropertiesControllerTest < ActionController::TestCase
  setup do
    @my_property = my_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_property" do
    assert_difference('MyProperty.count') do
      post :create, my_property: { email: @my_property.email, phone: @my_property.phone, plot_number: @my_property.plot_number, price: @my_property.price, size: @my_property.size, status: @my_property.status, type: @my_property.type, village: @my_property.village }
    end

    assert_redirected_to my_property_path(assigns(:my_property))
  end

  test "should show my_property" do
    get :show, id: @my_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_property
    assert_response :success
  end

  test "should update my_property" do
    put :update, id: @my_property, my_property: { email: @my_property.email, phone: @my_property.phone, plot_number: @my_property.plot_number, price: @my_property.price, size: @my_property.size, status: @my_property.status, type: @my_property.type, village: @my_property.village }
    assert_redirected_to my_property_path(assigns(:my_property))
  end

  test "should destroy my_property" do
    assert_difference('MyProperty.count', -1) do
      delete :destroy, id: @my_property
    end

    assert_redirected_to my_properties_path
  end
end
