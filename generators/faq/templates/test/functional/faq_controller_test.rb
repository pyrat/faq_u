require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../faq_helper'
require 'faq_controller'

# Re-raise errors caught by the controller.
class FaqController; def rescue_action(e) raise e end; end

class FaqControllerTest < Test::Unit::TestCase
  
  def setup
    @controller = FaqController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    create_faq
    get :index
    assert_response :success
    assert_not_nil assigns(:faqs)
  end
  
  def test_show
    faq = create_faq
    get :show, :id => faq.id
    assert_response :success
    assert_not_nil assigns(:faq)
  end
  
  
end
