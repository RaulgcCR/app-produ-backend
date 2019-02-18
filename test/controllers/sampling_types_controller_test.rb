require 'test_helper'

class SamplingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sampling_type = sampling_types(:one)
  end

  test "should get index" do
    get sampling_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sampling_type_url
    assert_response :success
  end

  test "should create sampling_type" do
    assert_difference('SamplingType.count') do
      post sampling_types_url, params: { sampling_type: { nombre: @sampling_type.nombre } }
    end

    assert_redirected_to sampling_type_url(SamplingType.last)
  end

  test "should show sampling_type" do
    get sampling_type_url(@sampling_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sampling_type_url(@sampling_type)
    assert_response :success
  end

  test "should update sampling_type" do
    patch sampling_type_url(@sampling_type), params: { sampling_type: { nombre: @sampling_type.nombre } }
    assert_redirected_to sampling_type_url(@sampling_type)
  end

  test "should destroy sampling_type" do
    assert_difference('SamplingType.count', -1) do
      delete sampling_type_url(@sampling_type)
    end

    assert_redirected_to sampling_types_url
  end
end
