require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "successful post" do
      assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post :create, quote: {
         name: 'James Colestock',
         email: 'jamescolestock@gmail.com',
         subject: 'Vista Hardwood Test',
         content: 'This is the content of the message'
      }
      end 
      assert_redirected_to new_quote_path
      last_email = ActionMailer::Base.deliveries.last

      assert_equal "Vista Hardwood Test", last_email.subject
      assert_equal 'james@colestock.com', last_email.to[0]
      assert_equal 'jamescolestock@gmail.com', last_email.from[0]
      assert_match(/This is the content of the message/, last_email.body.to_s)

      ActionMailer::Base.deliveries.clear

   end
end
