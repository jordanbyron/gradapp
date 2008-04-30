require File.dirname(__FILE__) + '/../test_helper'

class CourseTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:course_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_course_template
    assert_difference('CourseTemplate.count') do
      post :create, :course_template => { }
    end

    assert_redirected_to course_template_path(assigns(:course_template))
  end

  def test_should_show_course_template
    get :show, :id => course_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => course_templates(:one).id
    assert_response :success
  end

  def test_should_update_course_template
    put :update, :id => course_templates(:one).id, :course_template => { }
    assert_redirected_to course_template_path(assigns(:course_template))
  end

  def test_should_destroy_course_template
    assert_difference('CourseTemplate.count', -1) do
      delete :destroy, :id => course_templates(:one).id
    end

    assert_redirected_to course_templates_path
  end
end
