require File.dirname(__FILE__) + '/../test_helper'

class DegreeRequirementsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:degree_requirements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_degree_requirement
    assert_difference('DegreeRequirement.count') do
      post :create, :degree_requirement => { }
    end

    assert_redirected_to degree_requirement_path(assigns(:degree_requirement))
  end

  def test_should_show_degree_requirement
    get :show, :id => degree_requirements(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => degree_requirements(:one).id
    assert_response :success
  end

  def test_should_update_degree_requirement
    put :update, :id => degree_requirements(:one).id, :degree_requirement => { }
    assert_redirected_to degree_requirement_path(assigns(:degree_requirement))
  end

  def test_should_destroy_degree_requirement
    assert_difference('DegreeRequirement.count', -1) do
      delete :destroy, :id => degree_requirements(:one).id
    end

    assert_redirected_to degree_requirements_path
  end
end
