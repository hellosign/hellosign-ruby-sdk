require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::BulkSendJobApi.new

bulk_send_job_id = "6e683bc0369ba3d5b6f43c2c22a8031dbf6bd174"

begin
  result = api.bulk_send_job_get(bulk_send_job_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end
