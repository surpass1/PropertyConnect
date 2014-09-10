require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get land_sale" do
    get :land_sale
    assert_response :success
  end

  test "should get land_rent" do
    get :land_rent
    assert_response :success
  end

  test "should get land_lease" do
    get :land_lease
    assert_response :success
  end

end
