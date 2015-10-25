class QuotesController < ApplicationController
  def new
     @quote = Quote.new;
  end
 
  def create
     @quote = Quote.new(quote_params)
     if @quote.valid?
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
