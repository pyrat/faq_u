require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../faq_helper'
require 'faq_admin_controller'

# Re-raise errors caught by the controller.
class FaqAdminController; def rescue_action(e) raise e end; end

class FaqAdminControllerTest < Test::Unit::TestCase
  
  def setup
    @controller = FaqAdminController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @faq = create_faq
  end
  
  def test_new
    get :new
    assert_response :success
    assert_not_nil(assigns(:faq))
    assert_template 'new'
  end
  
  def test_create
    post :create, :faq => get_faq_hash
    assert_response :redirect
  end
  
  def test_edit
    get :edit, :id => @faq
    assert_response :success
    assert_not_nil(assigns(:faq))
    assert_template 'edit'
  end
  
  def test_update
    put :update, :id => @faq, :faq => get_faq_hash(:answer => 'Really fast, especially at intervals.')
    assert_response :redirect
  end
  
  def test_destroy
    count = Faq.count
    post :destroy, :id => @faq
    assert_response :redirect
    assert_equal(count - 1, Faq.count)
  end
  
  def test_index
    faq = create_faq
    assert_valid(faq)
    get :index
    assert_response :success
    assert_not_nil(assigns(:faqs))
  end
  
end
