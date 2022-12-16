require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

data = HelloSign::UnclaimedDraftCreateEmbeddedRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.file = [File.new("example_signature_request.pdf", "r")]
data.requester_email_address = "jack@hellosign.com"
data.test_mode = true

begin
  result = api.unclaimed_draft_create_embedded(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
