require File.dirname(__FILE__) + '/../test_helper'

class PposHeadersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ppos_headers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ppos_header
    assert_difference('PposHeader.count') do
      post :create, :ppos_header => { }
    end

    assert_redirected_to ppos_header_path(assigns(:ppos_header))
  end

  def test_should_show_ppos_header
    get :show, :id => ppos_headers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ppos_headers(:one).id
    assert_response :success
  end

  def test_should_update_ppos_header
    put :update, :id => ppos_headers(:one).id, :ppos_header => { }
    assert_redirected_to ppos_header_path(assigns(:ppos_header))
  end

  def test_should_destroy_ppos_header
    assert_difference('PposHeader.count', -1) do
      delete :destroy, :id => ppos_headers(:one).id
    end

    assert_redirected_to ppos_headers_path
  end
end
