require File.dirname(__FILE__) + '/../test_helper'

class PposControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ppos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ppos
    assert_difference('Ppos.count') do
      post :create, :ppos => { }
    end

    assert_redirected_to ppos_path(assigns(:ppos))
  end

  def test_should_show_ppos
    get :show, :id => ppos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ppos(:one).id
    assert_response :success
  end

  def test_should_update_ppos
    put :update, :id => ppos(:one).id, :ppos => { }
    assert_redirected_to ppos_path(assigns(:ppos))
  end

  def test_should_destroy_ppos
    assert_difference('Ppos.count', -1) do
      delete :destroy, :id => ppos(:one).id
    end

    assert_redirected_to ppos_path
  end
end
