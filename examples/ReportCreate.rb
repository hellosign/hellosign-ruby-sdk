require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ReportApi.new

data = HelloSign::ReportCreateRequest.new
data.start_date = "09/01/2020"
data.end_date = "09/01/2020"
data.report_type = %w[user_activity document_status]

begin
  result = api.report_create(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
