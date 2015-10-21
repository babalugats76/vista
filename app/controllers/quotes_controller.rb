class QuotesController < ApplicationController
  def new
     @quote = Quote.new;
  end
 
  def create
     @quote = Quote.new(quote_params)
     if @quote.valid?
         QuoteMailer.message_me(@quote).deliver_now
         redirect_to quote_path, notice: "Thank you.  We will be contacting you about your request for a quote soon."
     else
         render :new
     end 
  end

  private 

  def quote_params
     params.require(:quote).permit(:name, :city, :email, :phone, :details)
  end

end
