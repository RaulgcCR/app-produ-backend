require 'test_helper'

class OperatorRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operator_register = operator_registers(:one)
  end

  test "should get index" do
    get operator_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_operator_register_url
    assert_response :success
  end

  test "should create operator_register" do
    assert_difference('OperatorRegister.count') do
      post operator_registers_url, params: { operator_register: {  } }
    end

    assert_redirected_to operator_register_url(OperatorRegister.last)
  end

  test "should show operator_register" do
    get operator_register_url(@operator_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_operator_register_url(@operator_register)
    assert_response :success
  end

  test "should update operator_register" do
    patch operator_register_url(@operator_register), params: { operator_register: {  } }
    assert_redirected_to operator_register_url(@operator_register)
  end

  test "should destroy operator_register" do
    assert_difference('OperatorRegister.count', -1) do
      delete operator_register_url(@operator_register)
    end

    assert_redirected_to operator_registers_url
  end
end
