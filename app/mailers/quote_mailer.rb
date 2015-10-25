class QuoteMailer < ApplicationMailer
   default :to => "jamescolestock@gmail.com"
   default :from => "james@colestock.com"
   default :reply_to => "noreply@colestock.com"
   def rfq_email(quote)
      @quote = quote
      mail(from: @quote.email, cc: @quote.email, subject: "Request for Quote from #{@quote.name.split.map(&:capitalize).join(' ')}")
   end
end