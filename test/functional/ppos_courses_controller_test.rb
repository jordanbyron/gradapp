require File.dirname(__FILE__) + '/../test_helper'

class PposCoursesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ppos_courses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ppos_course
    assert_difference('PposCourse.count') do
      post :create, :ppos_course => { }
    end

    assert_redirected_to ppos_course_path(assigns(:ppos_course))
  end

  def test_should_show_ppos_course
    get :show, :id => ppos_courses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ppos_courses(:one).id
    assert_response :success
  end

  def test_should_update_ppos_course
    put :update, :id => ppos_courses(:one).id, :ppos_course => { }
    assert_redirected_to ppos_course_path(assigns(:ppos_course))
  end

  def test_should_destroy_ppos_course
    assert_difference('PposCourse.count', -1) do
      delete :destroy, :id => ppos_courses(:one).id
    end

    assert_redirected_to ppos_courses_path
  end
end
