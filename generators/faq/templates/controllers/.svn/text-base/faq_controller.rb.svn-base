class FaqController < ApplicationController
  
  def index
    @faqs = Faq.find :all
  end
  
  def show
    @faq = Faq.find params[:id]
  end
  
end
