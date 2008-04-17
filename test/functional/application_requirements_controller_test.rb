require File.dirname(__FILE__) + '/../test_helper'

class ApplicationRequirementsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:application_requirements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_application_requirement
    assert_difference('ApplicationRequirement.count') do
      post :create, :application_requirement => { }
    end

    assert_redirected_to application_requirement_path(assigns(:application_requirement))
  end

  def test_should_show_application_requirement
    get :show, :id => application_requirements(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => application_requirements(:one).id
    assert_response :success
  end

  def test_should_update_application_requirement
    put :update, :id => application_requirements(:one).id, :application_requirement => { }
    assert_redirected_to application_requirement_path(assigns(:application_requirement))
  end

  def test_should_destroy_application_requirement
    assert_difference('ApplicationRequirement.count', -1) do
      delete :destroy, :id => application_requirements(:one).id
    end

    assert_redirected_to application_requirements_path
  end
end
