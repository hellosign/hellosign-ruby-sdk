# HelloSign::EmbeddedApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`embedded_edit_url`](EmbeddedApi.md#embedded_edit_url) | **POST** `/embedded/edit_url/{template_id}` | Get Embedded Template Edit URL |
| [`embedded_sign_url`](EmbeddedApi.md#embedded_sign_url) | **GET** `/embedded/sign_url/{signature_id}` | Get Embedded Sign URL |


## `embedded_edit_url`

> `<EmbeddedEditUrlResponse> embedded_edit_url(template_id, embedded_edit_url_request)`

Get Embedded Template Edit URL

Retrieves an embedded object containing a template url that can be opened in an iFrame. Note that only templates created via the embedded template process are available to be edited with this endpoint.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::EmbeddedApi.new

data = HelloSign::EmbeddedEditUrlRequest.new
data.cc_roles = [""]
data.merge_fields = []

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.embedded_edit_url(template_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `embedded_edit_url_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<EmbeddedEditUrlResponse>, Integer, Hash)> embedded_edit_url_with_http_info(template_id, embedded_edit_url_request)`

```ruby
begin
  # Get Embedded Template Edit URL
  data, status_code, headers = api_instance.embedded_edit_url_with_http_info(template_id, embedded_edit_url_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EmbeddedEditUrlResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling EmbeddedApi->embedded_edit_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the template to edit. |  |
| `embedded_edit_url_request` | [**EmbeddedEditUrlRequest**](EmbeddedEditUrlRequest.md) |  |  |

### Return type

[**EmbeddedEditUrlResponse**](EmbeddedEditUrlResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `embedded_sign_url`

> `<EmbeddedSignUrlResponse> embedded_sign_url(signature_id)`

Get Embedded Sign URL

Retrieves an embedded object containing a signature url that can be opened in an iFrame. Note that templates created via the embedded template process will only be accessible through the API.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::EmbeddedApi.new

signature_id = "50e3542f738adfa7ddd4cbd4c00d2a8ab6e4194b"

begin
  result = api.embedded_sign_url(signature_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `embedded_sign_url_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<EmbeddedSignUrlResponse>, Integer, Hash)> embedded_sign_url_with_http_info(signature_id)`

```ruby
begin
  # Get Embedded Sign URL
  data, status_code, headers = api_instance.embedded_sign_url_with_http_info(signature_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <EmbeddedSignUrlResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling EmbeddedApi->embedded_sign_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_id` | **String** | The id of the signature to get a signature url for. |  |

### Return type

[**EmbeddedSignUrlResponse**](EmbeddedSignUrlResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

