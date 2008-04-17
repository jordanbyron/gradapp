require File.dirname(__FILE__) + '/../test_helper'

class CorrespondencesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:correspondences)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_correspondence
    assert_difference('Correspondence.count') do
      post :create, :correspondence => { }
    end

    assert_redirected_to correspondence_path(assigns(:correspondence))
  end

  def test_should_show_correspondence
    get :show, :id => correspondences(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => correspondences(:one).id
    assert_response :success
  end

  def test_should_update_correspondence
    put :update, :id => correspondences(:one).id, :correspondence => { }
    assert_redirected_to correspondence_path(assigns(:correspondence))
  end

  def test_should_destroy_correspondence
    assert_difference('Correspondence.count', -1) do
      delete :destroy, :id => correspondences(:one).id
    end

    assert_redirected_to correspondences_path
  end
end
