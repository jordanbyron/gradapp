require File.dirname(__FILE__) + '/../test_helper'

class CorrespondenceTemplatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:correspondence_templates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_correspondence_template
    assert_difference('CorrespondenceTemplate.count') do
      post :create, :correspondence_template => { }
    end

    assert_redirected_to correspondence_template_path(assigns(:correspondence_template))
  end

  def test_should_show_correspondence_template
    get :show, :id => correspondence_templates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => correspondence_templates(:one).id
    assert_response :success
  end

  def test_should_update_correspondence_template
    put :update, :id => correspondence_templates(:one).id, :correspondence_template => { }
    assert_redirected_to correspondence_template_path(assigns(:correspondence_template))
  end

  def test_should_destroy_correspondence_template
    assert_difference('CorrespondenceTemplate.count', -1) do
      delete :destroy, :id => correspondence_templates(:one).id
    end

    assert_redirected_to correspondence_templates_path
  end
end
