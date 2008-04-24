require File.dirname(__FILE__) + '/../test_helper'

class StudentStatusesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:student_statuses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_student_status
    assert_difference('StudentStatus.count') do
      post :create, :student_status => { }
    end

    assert_redirected_to student_status_path(assigns(:student_status))
  end

  def test_should_show_student_status
    get :show, :id => student_statuses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => student_statuses(:one).id
    assert_response :success
  end

  def test_should_update_student_status
    put :update, :id => student_statuses(:one).id, :student_status => { }
    assert_redirected_to student_status_path(assigns(:student_status))
  end

  def test_should_destroy_student_status
    assert_difference('StudentStatus.count', -1) do
      delete :destroy, :id => student_statuses(:one).id
    end

    assert_redirected_to student_statuses_path
  end
end
