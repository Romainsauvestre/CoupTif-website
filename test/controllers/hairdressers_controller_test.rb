require 'test_helper'

class HairdressersControllerTest < ActionController::TestCase
  setup do
    @hairdresser = hairdressers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hairdressers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hairdresser" do
    assert_difference('Hairdresser.count') do
      post :create, hairdresser: { description: @hairdresser.description, first_name: @hairdresser.first_name, last_name: @hairdresser.last_name, photo: @hairdresser.photo }
    end

    assert_redirected_to hairdresser_path(assigns(:hairdresser))
  end

  test "should show hairdresser" do
    get :show, id: @hairdresser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hairdresser
    assert_response :success
  end

  test "should update hairdresser" do
    patch :update, id: @hairdresser, hairdresser: { description: @hairdresser.description, first_name: @hairdresser.first_name, last_name: @hairdresser.last_name, photo: @hairdresser.photo }
    assert_redirected_to hairdresser_path(assigns(:hairdresser))
  end

  test "should destroy hairdresser" do
    assert_difference('Hairdresser.count', -1) do
      delete :destroy, id: @hairdresser
    end

    assert_redirected_to hairdressers_path
  end
end
