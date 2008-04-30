require File.dirname(__FILE__) + '/../test_helper'

class ConsentrationsTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:consentrations_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_consentrations_template
    assert_difference('ConsentrationsTemplate.count') do
      post :create, :consentrations_template => { }
    end

    assert_redirected_to consentrations_template_path(assigns(:consentrations_template))
  end

  def test_should_show_consentrations_template
    get :show, :id => consentrations_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => consentrations_templates(:one).id
    assert_response :success
  end

  def test_should_update_consentrations_template
    put :update, :id => consentrations_templates(:one).id, :consentrations_template => { }
    assert_redirected_to consentrations_template_path(assigns(:consentrations_template))
  end

  def test_should_destroy_consentrations_template
    assert_difference('ConsentrationsTemplate.count', -1) do
      delete :destroy, :id => consentrations_templates(:one).id
    end

    assert_redirected_to consentrations_templates_path
  end
end
