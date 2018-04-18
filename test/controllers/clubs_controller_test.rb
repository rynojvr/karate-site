require 'test_helper'

class DojosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dojo = dojos(:one)
  end

  test "should get index" do
    get dojos_url
    assert_response :success
  end

  test "should get new" do
    get new_dojo_url
    assert_response :success
  end

  test "should create dojo" do
    assert_difference('Dojo.count') do
      post dojos_url, params: { dojo: { cell: @dojo.cell, cell: @dojo.cell, contact_number: @dojo.contact_number, email: @dojo.email, landline: @dojo.landline, name: @dojo.name, sensei: @dojo.sensei } }
    end

    assert_redirected_to dojo_url(Dojo.last)
  end

  test "should show dojo" do
    get dojo_url(@dojo)
    assert_response :success
  end

  test "should get edit" do
    get edit_dojo_url(@dojo)
    assert_response :success
  end

  test "should update dojo" do
    patch dojo_url(@dojo), params: { dojo: { cell: @dojo.cell, cell: @dojo.cell, contact_number: @dojo.contact_number, email: @dojo.email, landline: @dojo.landline, name: @dojo.name, sensei: @dojo.sensei } }
    assert_redirected_to dojo_url(@dojo)
  end

  test "should destroy dojo" do
    assert_difference('Dojo.count', -1) do
      delete dojo_url(@dojo)
    end

    assert_redirected_to dojos_url
  end
end