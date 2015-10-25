class QuoteMailer < ApplicationMailer
   default :to => "jamescolestock@gmail.com"
   def rfq_email(quote)
      @quote = quote
      mail(from: @quote.email, subject: "Request for Quote from #{@quote.name.split.map(&:capitalize).join(' ')}")
   end
end