require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

data = HelloSign::TemplateUpdateFilesRequest.new
data.file_url = ["https://app.hellosign.com/docs/example_signature_request.pdf"]

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.template_update_files(template_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
