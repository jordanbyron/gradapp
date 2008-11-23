require File.dirname(__FILE__) + '/../test_helper'

class SupportRequestsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:support_requests)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_support_request
    assert_difference('SupportRequest.count') do
      post :create, :support_request => { }
    end

    assert_redirected_to support_request_path(assigns(:support_request))
  end

  def test_should_show_support_request
    get :show, :id => support_requests(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => support_requests(:one).id
    assert_response :success
  end

  def test_should_update_support_request
    put :update, :id => support_requests(:one).id, :support_request => { }
    assert_redirected_to support_request_path(assigns(:support_request))
  end

  def test_should_destroy_support_request
    assert_difference('SupportRequest.count', -1) do
      delete :destroy, :id => support_requests(:one).id
    end

    assert_redirected_to support_requests_path
  end
end
