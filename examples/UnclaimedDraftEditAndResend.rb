require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

data = HelloSign::UnclaimedDraftEditAndResendRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.test_mode = true

signature_request_id = "2f9781e1a83jdja934d808c153c2e1d3df6f8f2f"

begin
  result = api.unclaimed_draft_edit_and_resend(signature_request_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
