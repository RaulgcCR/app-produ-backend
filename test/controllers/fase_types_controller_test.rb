require 'test_helper'

class FaseTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fase_type = fase_types(:one)
  end

  test "should get index" do
    get fase_types_url
    assert_response :success
  end

  test "should get new" do
    get new_fase_type_url
    assert_response :success
  end

  test "should create fase_type" do
    assert_difference('FaseType.count') do
      post fase_types_url, params: { fase_type: { nombre: @fase_type.nombre } }
    end

    assert_redirected_to fase_type_url(FaseType.last)
  end

  test "should show fase_type" do
    get fase_type_url(@fase_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_fase_type_url(@fase_type)
    assert_response :success
  end

  test "should update fase_type" do
    patch fase_type_url(@fase_type), params: { fase_type: { nombre: @fase_type.nombre } }
    assert_redirected_to fase_type_url(@fase_type)
  end

  test "should destroy fase_type" do
    assert_difference('FaseType.count', -1) do
      delete fase_type_url(@fase_type)
    end

    assert_redirected_to fase_types_url
  end
end
