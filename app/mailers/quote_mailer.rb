class QuoteMailer < ApplicationMailer
   default :to => "sales@vistahardwood.com"
   default :from => "Vista Hardwood Floors <no-reply@vistahardwood.com>"
   default :reply_to => "no-reply@vistahardwood.com"
   def rfq_email(quote)
      @quote = quote
      mail(cc: "#{@quote.name.split.map(&:capitalize).join(' ')} <#{@quote.email}>", subject: "Request for Quote from #{@quote.name.split.map(&:capitalize).join(' ')}")
   end
end