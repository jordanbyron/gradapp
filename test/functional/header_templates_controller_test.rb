require File.dirname(__FILE__) + '/../test_helper'

class HeaderTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:header_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_header_template
    assert_difference('HeaderTemplate.count') do
      post :create, :header_template => { }
    end

    assert_redirected_to header_template_path(assigns(:header_template))
  end

  def test_should_show_header_template
    get :show, :id => header_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => header_templates(:one).id
    assert_response :success
  end

  def test_should_update_header_template
    put :update, :id => header_templates(:one).id, :header_template => { }
    assert_redirected_to header_template_path(assigns(:header_template))
  end

  def test_should_destroy_header_template
    assert_difference('HeaderTemplate.count', -1) do
      delete :destroy, :id => header_templates(:one).id
    end

    assert_redirected_to header_templates_path
  end
end
