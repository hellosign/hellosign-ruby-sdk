require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

data = HelloSign::TemplateRemoveUserRequest.new
data.email_address = "george@hellosign.com"

template_id = "21f920ec2b7f4b6bb64d3ed79f26303843046536"

begin
  result = api.template_remove_user(template_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
