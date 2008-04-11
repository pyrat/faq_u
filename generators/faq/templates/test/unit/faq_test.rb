require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../faq_helper'

class FaqTest < Test::Unit::TestCase
  
  def test_create_success
    faq = create_faq
    assert_valid(faq)
  end
  
  def test_create_error
    faq = create_faq(:question => '')
    assert(!faq.valid?)
  end
  
end
