require File.dirname(__FILE__) + '/../test_helper'

class PposPrerequisitesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ppos_prerequisites)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_ppos_prerequisite
    assert_difference('PposPrerequisite.count') do
      post :create, :ppos_prerequisite => { }
    end

    assert_redirected_to ppos_prerequisite_path(assigns(:ppos_prerequisite))
  end

  def test_should_show_ppos_prerequisite
    get :show, :id => ppos_prerequisites(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => ppos_prerequisites(:one).id
    assert_response :success
  end

  def test_should_update_ppos_prerequisite
    put :update, :id => ppos_prerequisites(:one).id, :ppos_prerequisite => { }
    assert_redirected_to ppos_prerequisite_path(assigns(:ppos_prerequisite))
  end

  def test_should_destroy_ppos_prerequisite
    assert_difference('PposPrerequisite.count', -1) do
      delete :destroy, :id => ppos_prerequisites(:one).id
    end

    assert_redirected_to ppos_prerequisites_path
  end
end
