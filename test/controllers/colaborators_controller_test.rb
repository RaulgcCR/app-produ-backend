require 'test_helper'

class ColaboratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colaborator = colaborators(:one)
  end

  test "should get index" do
    get colaborators_url
    assert_response :success
  end

  test "should get new" do
    get new_colaborator_url
    assert_response :success
  end

  test "should create colaborator" do
    assert_difference('Colaborator.count') do
      post colaborators_url, params: { colaborator: {  } }
    end

    assert_redirected_to colaborator_url(Colaborator.last)
  end

  test "should show colaborator" do
    get colaborator_url(@colaborator)
    assert_response :success
  end

  test "should get edit" do
    get edit_colaborator_url(@colaborator)
    assert_response :success
  end

  test "should update colaborator" do
    patch colaborator_url(@colaborator), params: { colaborator: {  } }
    assert_redirected_to colaborator_url(@colaborator)
  end

  test "should destroy colaborator" do
    assert_difference('Colaborator.count', -1) do
      delete colaborator_url(@colaborator)
    end

    assert_redirected_to colaborators_url
  end
end
