class Test::Unit::TestCase

  def get_faq_hash(options = {})
    {
      :question => 'How fast can you run?',
      :answer => 'Very very fast. Especially if I am being chased.'
    }.merge(options)
  end
  
  def create_faq(options = {})
    Faq.create(
      get_faq_hash(options)
    )
  end

end
