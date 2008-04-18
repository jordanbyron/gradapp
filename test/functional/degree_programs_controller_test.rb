require File.dirname(__FILE__) + '/../test_helper'

class DegreeProgramsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:degree_programs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_degree_program
    assert_difference('DegreeProgram.count') do
      post :create, :degree_program => { }
    end

    assert_redirected_to degree_program_path(assigns(:degree_program))
  end

  def test_should_show_degree_program
    get :show, :id => degree_programs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => degree_programs(:one).id
    assert_response :success
  end

  def test_should_update_degree_program
    put :update, :id => degree_programs(:one).id, :degree_program => { }
    assert_redirected_to degree_program_path(assigns(:degree_program))
  end

  def test_should_destroy_degree_program
    assert_difference('DegreeProgram.count', -1) do
      delete :destroy, :id => degree_programs(:one).id
    end

    assert_redirected_to degree_programs_path
  end
end
