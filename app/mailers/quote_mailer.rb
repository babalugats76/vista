class QuoteMailer < ApplicationMailer
   default :to => "James Colestock <james@colestock.com>"
   default :from => "Vista Hardwood Floors <james@colestock.com>"
   default :reply_to => "no-reply@colestock.com"
   def rfq_email(quote)
      @quote = quote
      mail(cc: "#{@quote.name.split.map(&:capitalize).join(' ')} <#{@quote.email}>", subject: "Request for Quote from #{@quote.name.split.map(&:capitalize).join(' ')}")
   end
end