require File.dirname(__FILE__) + '/../test_helper'

class GraduateApplicantsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:graduate_applicants)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_graduate_applicant
    assert_difference('GraduateApplicant.count') do
      post :create, :graduate_applicant => { }
    end

    assert_redirected_to graduate_applicant_path(assigns(:graduate_applicant))
  end

  def test_should_show_graduate_applicant
    get :show, :id => graduate_applicants(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => graduate_applicants(:one).id
    assert_response :success
  end

  def test_should_update_graduate_applicant
    put :update, :id => graduate_applicants(:one).id, :graduate_applicant => { }
    assert_redirected_to graduate_applicant_path(assigns(:graduate_applicant))
  end

  def test_should_destroy_graduate_applicant
    assert_difference('GraduateApplicant.count', -1) do
      delete :destroy, :id => graduate_applicants(:one).id
    end

    assert_redirected_to graduate_applicants_path
  end
end
