require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::OAuthApi.new

data = HelloSign::OAuthTokenGenerateRequest.new
data.state = "900e06e2"
data.code = "1b0d28d90c86c141"
data.client_id = "cc91c61d00f8bb2ece1428035716b"
data.client_secret = "1d14434088507ffa390e6f5528465"

begin
  result = api.oauth_token_generate(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
