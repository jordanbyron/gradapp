require File.dirname(__FILE__) + '/../test_helper'

class NotesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_notes
    assert_difference('Notes.count') do
      post :create, :notes => { }
    end

    assert_redirected_to notes_path(assigns(:notes))
  end

  def test_should_show_notes
    get :show, :id => notes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => notes(:one).id
    assert_response :success
  end

  def test_should_update_notes
    put :update, :id => notes(:one).id, :notes => { }
    assert_redirected_to notes_path(assigns(:notes))
  end

  def test_should_destroy_notes
    assert_difference('Notes.count', -1) do
      delete :destroy, :id => notes(:one).id
    end

    assert_redirected_to notes_path
  end
end
