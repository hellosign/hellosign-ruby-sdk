# HelloSign::ReportApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`report_create`](ReportApi.md#report_create) | **POST** `/report/create` | Create Report |


## `report_create`

> `<ReportCreateResponse> report_create(report_create_request)`

Create Report

Request the creation of one or more report(s).  When the report(s) have been generated, you will receive an email (one per requested report type) containing a link to download the report as a CSV file. The requested date range may be up to 12 months in duration, and `start_date` must not be more than 10 years in the past.

### Examples

```ruby
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

```

#### Using the `report_create_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<ReportCreateResponse>, Integer, Hash)> report_create_with_http_info(report_create_request)`

```ruby
begin
  # Create Report
  data, status_code, headers = api_instance.report_create_with_http_info(report_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReportCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling ReportApi->report_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `report_create_request` | [**ReportCreateRequest**](ReportCreateRequest.md) |  |  |

### Return type

[**ReportCreateResponse**](ReportCreateResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

