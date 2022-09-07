require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::AccountApi.new

data = HelloSign::AccountUpdateRequest.new
data.callback_url = "https://www.example.com/callback"

begin
  result = api.account_update(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
