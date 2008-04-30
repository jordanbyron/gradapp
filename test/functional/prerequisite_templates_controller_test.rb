require File.dirname(__FILE__) + '/../test_helper'

class PrerequisiteTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:prerequisite_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_prerequisite_template
    assert_difference('PrerequisiteTemplate.count') do
      post :create, :prerequisite_template => { }
    end

    assert_redirected_to prerequisite_template_path(assigns(:prerequisite_template))
  end

  def test_should_show_prerequisite_template
    get :show, :id => prerequisite_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => prerequisite_templates(:one).id
    assert_response :success
  end

  def test_should_update_prerequisite_template
    put :update, :id => prerequisite_templates(:one).id, :prerequisite_template => { }
    assert_redirected_to prerequisite_template_path(assigns(:prerequisite_template))
  end

  def test_should_destroy_prerequisite_template
    assert_difference('PrerequisiteTemplate.count', -1) do
      delete :destroy, :id => prerequisite_templates(:one).id
    end

    assert_redirected_to prerequisite_templates_path
  end
end
