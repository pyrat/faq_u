class FaqAdminController < ApplicationController

  def index
    @faqs = Faq.find :all
  end
  
  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      flash[:message] = "Successfully created..."
      redirect_to faq_admin_url
    else
      render :action => :new
    end
  end

  def edit
    @faq = Faq.find params[:id]
  end

  def update
    @faq = Faq.find params[:id]
    if @faq.update_attributes(params[:faq])
      flash[:message] = "Successfully updated..."
      redirect_to faq_admin_url
    else
      render :action => :edit
    end
  end

  def destroy
    @faq = Faq.find params[:id]
    @faq.destroy
    flash[:message] = "Deleted successfully."
    redirect_to faq_admin_url
  end


end
