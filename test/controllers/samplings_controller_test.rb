require 'test_helper'

class SamplingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sampling = samplings(:one)
  end

  test "should get index" do
    get samplings_url
    assert_response :success
  end

  test "should get new" do
    get new_sampling_url
    assert_response :success
  end

  test "should create sampling" do
    assert_difference('Sampling.count') do
      post samplings_url, params: { sampling: { cantMuestras: @sampling.cantMuestras, cantMuestrasTotal: @sampling.cantMuestrasTotal, descripcion: @sampling.descripcion, fase: @sampling.fase, nombre: @sampling.nombre } }
    end

    assert_redirected_to sampling_url(Sampling.last)
  end

  test "should show sampling" do
    get sampling_url(@sampling)
    assert_response :success
  end

  test "should get edit" do
    get edit_sampling_url(@sampling)
    assert_response :success
  end

  test "should update sampling" do
    patch sampling_url(@sampling), params: { sampling: { cantMuestras: @sampling.cantMuestras, cantMuestrasTotal: @sampling.cantMuestrasTotal, descripcion: @sampling.descripcion, fase: @sampling.fase, nombre: @sampling.nombre } }
    assert_redirected_to sampling_url(@sampling)
  end

  test "should destroy sampling" do
    assert_difference('Sampling.count', -1) do
      delete sampling_url(@sampling)
    end

    assert_redirected_to samplings_url
  end
end
