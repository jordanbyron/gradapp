require File.dirname(__FILE__) + '/../test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:attachments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_attachments
    assert_difference('Attachments.count') do
      post :create, :attachments => { }
    end

    assert_redirected_to attachments_path(assigns(:attachments))
  end

  def test_should_show_attachments
    get :show, :id => attachments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => attachments(:one).id
    assert_response :success
  end

  def test_should_update_attachments
    put :update, :id => attachments(:one).id, :attachments => { }
    assert_redirected_to attachments_path(assigns(:attachments))
  end

  def test_should_destroy_attachments
    assert_difference('Attachments.count', -1) do
      delete :destroy, :id => attachments(:one).id
    end

    assert_redirected_to attachments_path
  end
end
