# HelloSign::ApiAppApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`api_app_create`](ApiAppApi.md#api_app_create) | **POST** `/api_app` | Create API App |
| [`api_app_delete`](ApiAppApi.md#api_app_delete) | **DELETE** `/api_app/{client_id}` | Delete API App |
| [`api_app_get`](ApiAppApi.md#api_app_get) | **GET** `/api_app/{client_id}` | Get API App |
| [`api_app_list`](ApiAppApi.md#api_app_list) | **GET** `/api_app/list` | List API Apps |
| [`api_app_update`](ApiAppApi.md#api_app_update) | **PUT** `/api_app/{client_id}` | Update API App |


## `api_app_create`

> `<ApiAppGetResponse> api_app_create(api_app_create_request)`

Create API App

Creates a new API App.

### Examples

```ruby
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

```

#### Using the `api_app_create_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<ApiAppGetResponse>, Integer, Hash)> api_app_create_with_http_info(api_app_create_request)`

```ruby
begin
  # Create API App
  data, status_code, headers = api_instance.api_app_create_with_http_info(api_app_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiAppGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling ApiAppApi->api_app_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `api_app_create_request` | [**ApiAppCreateRequest**](ApiAppCreateRequest.md) |  |  |

### Return type

[**ApiAppGetResponse**](ApiAppGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `api_app_delete`

> `api_app_delete(client_id)`

Delete API App

Deletes an API App. Can only be invoked for apps you own.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ApiAppApi.new

client_id = "0dd3b823a682527788c4e40cb7b6f7e9"

begin
  result = api.api_app_delete(client_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `api_app_delete_with_http_info` variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> `<Array(nil, Integer, Hash)> api_app_delete_with_http_info(client_id)`

```ruby
begin
  # Delete API App
  data, status_code, headers = api_instance.api_app_delete_with_http_info(client_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue HelloSign::ApiError => e
  puts "Error when calling ApiAppApi->api_app_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `client_id` | **String** | The client id of the API App to delete. |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `api_app_get`

> `<ApiAppGetResponse> api_app_get(client_id)`

Get API App

Returns an object with information about an API App.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ApiAppApi.new

client_id = "0dd3b823a682527788c4e40cb7b6f7e9"

begin
  result = api.api_app_get(client_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `api_app_get_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<ApiAppGetResponse>, Integer, Hash)> api_app_get_with_http_info(client_id)`

```ruby
begin
  # Get API App
  data, status_code, headers = api_instance.api_app_get_with_http_info(client_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiAppGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling ApiAppApi->api_app_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `client_id` | **String** | The client id of the API App to retrieve. |  |

### Return type

[**ApiAppGetResponse**](ApiAppGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `api_app_list`

> `<ApiAppListResponse> api_app_list(opts)`

List API Apps

Returns a list of API Apps that are accessible by you. If you are on a team with an Admin or Developer role, this list will include apps owned by teammates.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ApiAppApi.new

page = 1
page_size = 2

begin
  result = api.api_app_list({ page: page, page_size: page_size })
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `api_app_list_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<ApiAppListResponse>, Integer, Hash)> api_app_list_with_http_info(opts)`

```ruby
begin
  # List API Apps
  data, status_code, headers = api_instance.api_app_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiAppListResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling ApiAppApi->api_app_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `page` | **Integer** | Which page number of the API App List to return. Defaults to `1`. | [optional][default to 1] |
| `page_size` | **Integer** | Number of objects to be returned per page. Must be between `1` and `100`. Default is `20`. | [optional][default to 20] |

### Return type

[**ApiAppListResponse**](ApiAppListResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `api_app_update`

> `<ApiAppGetResponse> api_app_update(client_id, api_app_update_request)`

Update API App

Updates an existing API App. Can only be invoked for apps you own. Only the fields you provide will be updated. If you wish to clear an existing optional field, provide an empty string.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::ApiAppApi.new

white_labeling_options = HelloSign::SubWhiteLabelingOptions.new
white_labeling_options.primary_button_color = "#00b3e6"
white_labeling_options.primary_button_text_color = "#ffffff"

custom_logo_file = File.new('./CustomLogoFile.png')

data = HelloSign::ApiAppUpdateRequest.new
data.name = "New Name"
data.callback_url = "http://example.com/hellosign"
data.white_labeling_options = white_labeling_options
data.custom_logo_file = custom_logo_file

client_id = "0dd3b823a682527788c4e40cb7b6f7e9"

begin
  result = api.api_app_update(client_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `api_app_update_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<ApiAppGetResponse>, Integer, Hash)> api_app_update_with_http_info(client_id, api_app_update_request)`

```ruby
begin
  # Update API App
  data, status_code, headers = api_instance.api_app_update_with_http_info(client_id, api_app_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiAppGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling ApiAppApi->api_app_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `client_id` | **String** | The client id of the API App to update. |  |
| `api_app_update_request` | [**ApiAppUpdateRequest**](ApiAppUpdateRequest.md) |  |  |

### Return type

[**ApiAppGetResponse**](ApiAppGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

