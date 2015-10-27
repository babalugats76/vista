class QuotesController < ApplicationController
  def new
     set_meta_tags title: 'Request a Quote',
              description: 'Complete our contact form to request a quote for your hardwood flooring project',
              keywords: 'quote, estimate, hardwood, floors, flooring, wood, repair, restore, Denver, vista'
     @quote = Quote.new;
  end
 
  def create
     @quote = Quote.new(quote_params)
     
     @recaptcha =  verify_recaptcha(:model => @post)
       
     if(!@recaptcha)
        @recaptcha_error = "Please complete the reCAPTCHA"
     end     
         
     if @quote.valid? && @recaptcha
        QuoteMailer.rfq_email(@quote).deliver_now
        redirect_to quote_path, :notice => "Thank you.  We will contact you soon about your request for a quote."
     else
        render :new
     end    

  end

  private 

  def quote_params
     params.require(:quote).permit(:name, :city, :email, :phone, :details)
  end

end
