require 'test_helper'

class MechanicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mechanic = mechanics(:one)
  end

  test "should get index" do
    get mechanics_url
    assert_response :success
  end

  test "should get new" do
    get new_mechanic_url
    assert_response :success
  end

  test "should create mechanic" do
    assert_difference('Mechanic.count') do
      post mechanics_url, params: { mechanic: { experience: @mechanic.experience, locaiton: @mechanic.locaiton, name: @mechanic.name, range: @mechanic.range } }
    end

    assert_redirected_to mechanic_url(Mechanic.last)
  end

  test "should show mechanic" do
    get mechanic_url(@mechanic)
    assert_response :success
  end

  test "should get edit" do
    get edit_mechanic_url(@mechanic)
    assert_response :success
  end

  test "should update mechanic" do
    patch mechanic_url(@mechanic), params: { mechanic: { experience: @mechanic.experience, locaiton: @mechanic.locaiton, name: @mechanic.name, range: @mechanic.range } }
    assert_redirected_to mechanic_url(@mechanic)
  end

  test "should destroy mechanic" do
    assert_difference('Mechanic.count', -1) do
      delete mechanic_url(@mechanic)
    end

    assert_redirected_to mechanics_url
  end
end
