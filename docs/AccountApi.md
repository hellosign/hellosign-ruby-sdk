# HelloSign::AccountApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`account_create`](AccountApi.md#account_create) | **POST** `/account/create` | Create Account |
| [`account_get`](AccountApi.md#account_get) | **GET** `/account` | Get Account |
| [`account_update`](AccountApi.md#account_update) | **PUT** `/account` | Update Account |
| [`account_verify`](AccountApi.md#account_verify) | **POST** `/account/verify` | Verify Account |


## `account_create`

> `<AccountCreateResponse> account_create(account_create_request)`

Create Account

Creates a new Dropbox Sign Account that is associated with the specified `email_address`.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::AccountApi.new

data = HelloSign::AccountCreateRequest.new
data.email_address = "newuser@hellosign.com"

begin
  result = api.account_create(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `account_create_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<AccountCreateResponse>, Integer, Hash)> account_create_with_http_info(account_create_request)`

```ruby
begin
  # Create Account
  data, status_code, headers = api_instance.account_create_with_http_info(account_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling AccountApi->account_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_create_request` | [**AccountCreateRequest**](AccountCreateRequest.md) |  |  |

### Return type

[**AccountCreateResponse**](AccountCreateResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `account_get`

> `<AccountGetResponse> account_get(opts)`

Get Account

Returns the properties and settings of your Account.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::AccountApi.new

begin
  result = api.account_get({ email_address: "jack@example.com" })
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `account_get_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<AccountGetResponse>, Integer, Hash)> account_get_with_http_info(opts)`

```ruby
begin
  # Get Account
  data, status_code, headers = api_instance.account_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling AccountApi->account_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | **String** | `account_id` or `email_address` is required. If both are provided, the account id prevails.  The ID of the Account. | [optional] |
| `email_address` | **String** | `account_id` or `email_address` is required, If both are provided, the account id prevails.  The email address of the Account. | [optional] |

### Return type

[**AccountGetResponse**](AccountGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `account_update`

> `<AccountGetResponse> account_update(account_update_request)`

Update Account

Updates the properties and settings of your Account. Currently only allows for updates to the [Callback URL](/api/reference/tag/Callbacks-and-Events) and locale.

### Examples

```ruby
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

```

#### Using the `account_update_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<AccountGetResponse>, Integer, Hash)> account_update_with_http_info(account_update_request)`

```ruby
begin
  # Update Account
  data, status_code, headers = api_instance.account_update_with_http_info(account_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling AccountApi->account_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_update_request` | [**AccountUpdateRequest**](AccountUpdateRequest.md) |  |  |

### Return type

[**AccountGetResponse**](AccountGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `account_verify`

> `<AccountVerifyResponse> account_verify(account_verify_request)`

Verify Account

Verifies whether an Dropbox Sign Account exists for the given email address.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::AccountApi.new

data = HelloSign::AccountVerifyRequest.new
data.email_address = "some_user@hellosign.com"

begin
  result = api.account_verify(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `account_verify_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<AccountVerifyResponse>, Integer, Hash)> account_verify_with_http_info(account_verify_request)`

```ruby
begin
  # Verify Account
  data, status_code, headers = api_instance.account_verify_with_http_info(account_verify_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountVerifyResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling AccountApi->account_verify_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_verify_request` | [**AccountVerifyRequest**](AccountVerifyRequest.md) |  |  |

### Return type

[**AccountVerifyResponse**](AccountVerifyResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

