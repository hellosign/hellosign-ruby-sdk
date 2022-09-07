require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ApiAppApi.new

oauth = HelloSign::SubOAuth.new
oauth.callback_url = "https://example.com/oauth"
oauth.scopes = %w[basic_account_info request_signature]

white_labeling_options = HelloSign::SubWhiteLabelingOptions.new
white_labeling_options.primary_button_color = "#00b3e6"
white_labeling_options.primary_button_text_color = "#ffffff"

custom_logo_file = File.new('./CustomLogoFile.png')

data = HelloSign::ApiAppCreateRequest.new
data.name = "My Production App"
data.domains = ["example.com"]
data.oauth = oauth
data.white_labeling_options = white_labeling_options
data.custom_logo_file = custom_logo_file

begin
  result = api.api_app_create(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
