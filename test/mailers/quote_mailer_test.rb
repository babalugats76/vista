require 'test_helper'

class QuoteMailerTest < ActionMailer::TestCase
   test "succesful post" do
        assert_difference 'ActionMailer::Base.deliveries.size', 1 do
        post :create, quote: {
           name: 'cornholio',
           email: 'james@colestock.com',
           subject: 'hi',
           content: 'bai'
        }
        end

      assert_redirected_to new_quote_path
        last_email = ActionMailer::Base.deliveries.last

        assert_equal "hi", last_email.subject
        assert_equal 'james@colestock.com', last_email.to[0]
        assert_equal 'james@colestock.com', last_email.from[0]
        assert_match(/bai/, last_email.body.to_s)

        ActionMailer::Base.deliveries.clear
   end
end
