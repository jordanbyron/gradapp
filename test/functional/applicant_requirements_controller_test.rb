require File.dirname(__FILE__) + '/../test_helper'

class ApplicantRequirementsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:applicant_requirements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_applicant_requirement
    assert_difference('ApplicantRequirement.count') do
      post :create, :applicant_requirement => { }
    end

    assert_redirected_to applicant_requirement_path(assigns(:applicant_requirement))
  end

  def test_should_show_applicant_requirement
    get :show, :id => applicant_requirements(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => applicant_requirements(:one).id
    assert_response :success
  end

  def test_should_update_applicant_requirement
    put :update, :id => applicant_requirements(:one).id, :applicant_requirement => { }
    assert_redirected_to applicant_requirement_path(assigns(:applicant_requirement))
  end

  def test_should_destroy_applicant_requirement
    assert_difference('ApplicantRequirement.count', -1) do
      delete :destroy, :id => applicant_requirements(:one).id
    end

    assert_redirected_to applicant_requirements_path
  end
end
