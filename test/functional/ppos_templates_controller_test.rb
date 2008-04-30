require File.dirname(__FILE__) + '/../test_helper'

class PposTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ppos_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ppos_template
    assert_difference('PposTemplate.count') do
      post :create, :ppos_template => { }
    end

    assert_redirected_to ppos_template_path(assigns(:ppos_template))
  end

  def test_should_show_ppos_template
    get :show, :id => ppos_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ppos_templates(:one).id
    assert_response :success
  end

  def test_should_update_ppos_template
    put :update, :id => ppos_templates(:one).id, :ppos_template => { }
    assert_redirected_to ppos_template_path(assigns(:ppos_template))
  end

  def test_should_destroy_ppos_template
    assert_difference('PposTemplate.count', -1) do
      delete :destroy, :id => ppos_templates(:one).id
    end

    assert_redirected_to ppos_templates_path
  end
end
