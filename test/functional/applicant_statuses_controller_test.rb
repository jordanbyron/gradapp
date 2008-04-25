require File.dirname(__FILE__) + '/../test_helper'

class ApplicantStatusesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:applicant_statuses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_applicant_status
    assert_difference('ApplicantStatus.count') do
      post :create, :applicant_status => { }
    end

    assert_redirected_to applicant_status_path(assigns(:applicant_status))
  end

  def test_should_show_applicant_status
    get :show, :id => applicant_statuses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => applicant_statuses(:one).id
    assert_response :success
  end

  def test_should_update_applicant_status
    put :update, :id => applicant_statuses(:one).id, :applicant_status => { }
    assert_redirected_to applicant_status_path(assigns(:applicant_status))
  end

  def test_should_destroy_applicant_status
    assert_difference('ApplicantStatus.count', -1) do
      delete :destroy, :id => applicant_statuses(:one).id
    end

    assert_redirected_to applicant_statuses_path
  end
end
