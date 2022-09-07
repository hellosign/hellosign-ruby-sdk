# HelloSign::OAuthApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`oauth_token_generate`](OAuthApi.md#oauth_token_generate) | **POST** `/oauth/token` | OAuth Token Generate |
| [`oauth_token_refresh`](OAuthApi.md#oauth_token_refresh) | **POST** `/oauth/token?refresh` | OAuth Token Refresh |


## `oauth_token_generate`

> `<OAuthTokenResponse> oauth_token_generate(o_auth_token_generate_request)`

OAuth Token Generate

Once you have retrieved the code from the user callback, you will need to exchange it for an access token via a backend call.

### Examples

```ruby
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

```

#### Using the `oauth_token_generate_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<OAuthTokenResponse>, Integer, Hash)> oauth_token_generate_with_http_info(o_auth_token_generate_request)`

```ruby
begin
  # OAuth Token Generate
  data, status_code, headers = api_instance.oauth_token_generate_with_http_info(o_auth_token_generate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OAuthTokenResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling OAuthApi->oauth_token_generate_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `o_auth_token_generate_request` | [**OAuthTokenGenerateRequest**](OAuthTokenGenerateRequest.md) |  |  |

### Return type

[**OAuthTokenResponse**](OAuthTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `oauth_token_refresh`

> `<OAuthTokenResponse> oauth_token_refresh(o_auth_token_refresh_request)`

OAuth Token Refresh

Access tokens are only valid for a given period of time (typically one hour) for security reasons. Whenever acquiring an new access token its TTL is also given (see `expires_in`), along with a refresh token that can be used to acquire a new access token after the current one has expired.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::OAuthApi.new

data = HelloSign::OAuthTokenRefreshRequest.new
data.refresh_token = "hNTI2MTFmM2VmZDQxZTZjOWRmZmFjZmVmMGMyNGFjMzI2MGI5YzgzNmE3"

begin
  result = api.oauth_token_refresh(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `oauth_token_refresh_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<OAuthTokenResponse>, Integer, Hash)> oauth_token_refresh_with_http_info(o_auth_token_refresh_request)`

```ruby
begin
  # OAuth Token Refresh
  data, status_code, headers = api_instance.oauth_token_refresh_with_http_info(o_auth_token_refresh_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OAuthTokenResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling OAuthApi->oauth_token_refresh_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `o_auth_token_refresh_request` | [**OAuthTokenRefreshRequest**](OAuthTokenRefreshRequest.md) |  |  |

### Return type

[**OAuthTokenResponse**](OAuthTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

