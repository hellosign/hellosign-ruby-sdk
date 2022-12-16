# HelloSign::TemplateApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`template_add_user`](TemplateApi.md#template_add_user) | **POST** `/template/add_user/{template_id}` | Add User to Template |
| [`template_create_embedded_draft`](TemplateApi.md#template_create_embedded_draft) | **POST** `/template/create_embedded_draft` | Create Embedded Template Draft |
| [`template_delete`](TemplateApi.md#template_delete) | **POST** `/template/delete/{template_id}` | Delete Template |
| [`template_files`](TemplateApi.md#template_files) | **GET** `/template/files/{template_id}` | Get Template Files |
| [`template_files_as_data_uri`](TemplateApi.md#template_files_as_data_uri) | **GET** `/template/files_as_data_uri/{template_id}` | Get Template Files as Data Uri |
| [`template_files_as_file_url`](TemplateApi.md#template_files_as_file_url) | **GET** `/template/files_as_file_url/{template_id}` | Get Template Files as File Url |
| [`template_get`](TemplateApi.md#template_get) | **GET** `/template/{template_id}` | Get Template |
| [`template_list`](TemplateApi.md#template_list) | **GET** `/template/list` | List Templates |
| [`template_remove_user`](TemplateApi.md#template_remove_user) | **POST** `/template/remove_user/{template_id}` | Remove User from Template |
| [`template_update_files`](TemplateApi.md#template_update_files) | **POST** `/template/update_files/{template_id}` | Update Template Files |


## `template_add_user`

> `<TemplateGetResponse> template_add_user(template_id, template_add_user_request)`

Add User to Template

Gives the specified Account access to the specified Template. The specified Account must be a part of your Team.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

data = HelloSign::TemplateAddUserRequest.new
data.email_address = "george@hellosign.com"

template_id = "f57db65d3f933b5316d398057a36176831451a35"

begin
  result = api.template_add_user(template_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_add_user_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateGetResponse>, Integer, Hash)> template_add_user_with_http_info(template_id, template_add_user_request)`

```ruby
begin
  # Add User to Template
  data, status_code, headers = api_instance.template_add_user_with_http_info(template_id, template_add_user_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_add_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the Template to give the Account access to. |  |
| `template_add_user_request` | [**TemplateAddUserRequest**](TemplateAddUserRequest.md) |  |  |

### Return type

[**TemplateGetResponse**](TemplateGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `template_create_embedded_draft`

> `<TemplateCreateEmbeddedDraftResponse> template_create_embedded_draft(template_create_embedded_draft_request)`

Create Embedded Template Draft

The first step in an embedded template workflow. Creates a draft template that can then be further set up in the template 'edit' stage.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

role_1 = HelloSign::SubTemplateRole.new
role_1.name = "Client"
role_1.order = 0

role_2 = HelloSign::SubTemplateRole.new
role_2.name = "Witness"
role_2.order = 1

merge_field_1 = HelloSign::SubMergeField.new
merge_field_1.name = "Full Name"
merge_field_1.type = "text"

merge_field_2 = HelloSign::SubMergeField.new
merge_field_2.name = "Is Registered?"
merge_field_2.type = "checkbox"

field_options = HelloSign::SubFieldOptions.new
field_options.date_format = "DD - MM - YYYY"

data = HelloSign::TemplateCreateEmbeddedDraftRequest.new
data.client_id = "37dee8d8440c66d54cfa05d92c160882"
data.file = [File.new("example_signature_request.pdf", "r")]
data.title = "Test Template"
data.subject = "Please sign this document"
data.message = "For your approval"
data.signer_roles = [role_1, role_2]
data.cc_roles = ["Manager"]
data.merge_fields = [merge_field_1, merge_field_2]
data.field_options = field_options
data.test_mode = true

begin
  result = api.template_create_embedded_draft(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_create_embedded_draft_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateCreateEmbeddedDraftResponse>, Integer, Hash)> template_create_embedded_draft_with_http_info(template_create_embedded_draft_request)`

```ruby
begin
  # Create Embedded Template Draft
  data, status_code, headers = api_instance.template_create_embedded_draft_with_http_info(template_create_embedded_draft_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateCreateEmbeddedDraftResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_create_embedded_draft_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_create_embedded_draft_request` | [**TemplateCreateEmbeddedDraftRequest**](TemplateCreateEmbeddedDraftRequest.md) |  |  |

### Return type

[**TemplateCreateEmbeddedDraftResponse**](TemplateCreateEmbeddedDraftResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `template_delete`

> `template_delete(template_id)`

Delete Template

Completely deletes the template specified from the account.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.template_delete(template_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_delete_with_http_info` variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> `<Array(nil, Integer, Hash)> template_delete_with_http_info(template_id)`

```ruby
begin
  # Delete Template
  data, status_code, headers = api_instance.template_delete_with_http_info(template_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the Template to delete. |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `template_files`

> `File template_files(template_id, opts)`

Get Template Files

Obtain a copy of the current documents specified by the `template_id` parameter. Returns a PDF or ZIP file.  If the files are currently being prepared, a status code of `409` will be returned instead. In this case please wait for the `template_created` callback event.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  file_bin = api.template_files(template_id)
  FileUtils.cp(file_bin.path, "path/to/file.pdf")
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_files_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(File, Integer, Hash)> template_files_with_http_info(template_id, opts)`

```ruby
begin
  # Get Template Files
  data, status_code, headers = api_instance.template_files_with_http_info(template_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_files_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the template files to retrieve. |  |
| `file_type` | **String** | Set to `pdf` for a single merged document or `zip` for a collection of individual documents. | [optional] |

### Return type

**File**

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/pdf, application/zip, application/json


## `template_files_as_data_uri`

> `<FileResponseDataUri> template_files_as_data_uri(template_id)`

Get Template Files as Data Uri

Obtain a copy of the current documents specified by the `template_id` parameter. Returns a JSON object with a `data_uri` representing the base64 encoded file (PDFs only).  If the files are currently being prepared, a status code of `409` will be returned instead. In this case please wait for the `template_created` callback event.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.template_files_as_data_uri(template_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_files_as_data_uri_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<FileResponseDataUri>, Integer, Hash)> template_files_as_data_uri_with_http_info(template_id)`

```ruby
begin
  # Get Template Files as Data Uri
  data, status_code, headers = api_instance.template_files_as_data_uri_with_http_info(template_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FileResponseDataUri>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_files_as_data_uri_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the template files to retrieve. |  |

### Return type

[**FileResponseDataUri**](FileResponseDataUri.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `template_files_as_file_url`

> `<FileResponse> template_files_as_file_url(template_id)`

Get Template Files as File Url

Obtain a copy of the current documents specified by the `template_id` parameter. Returns a JSON object with a url to the file (PDFs only).  If the files are currently being prepared, a status code of `409` will be returned instead. In this case please wait for the `template_created` callback event.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.template_files_as_file_url(template_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_files_as_file_url_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<FileResponse>, Integer, Hash)> template_files_as_file_url_with_http_info(template_id)`

```ruby
begin
  # Get Template Files as File Url
  data, status_code, headers = api_instance.template_files_as_file_url_with_http_info(template_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FileResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_files_as_file_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the template files to retrieve. |  |

### Return type

[**FileResponse**](FileResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `template_get`

> `<TemplateGetResponse> template_get(template_id)`

Get Template

Returns the Template specified by the `template_id` parameter.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

template_id = "f57db65d3f933b5316d398057a36176831451a35"

begin
  result = api.template_get(template_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_get_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateGetResponse>, Integer, Hash)> template_get_with_http_info(template_id)`

```ruby
begin
  # Get Template
  data, status_code, headers = api_instance.template_get_with_http_info(template_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the Template to retrieve. |  |

### Return type

[**TemplateGetResponse**](TemplateGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `template_list`

> `<TemplateListResponse> template_list(opts)`

List Templates

Returns a list of the Templates that are accessible by you.  Take a look at our [search guide](/api/reference/search/) to learn more about querying templates.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

account_id = "f57db65d3f933b5316d398057a36176831451a35"

begin
  result = api.template_list({account_id: account_id})
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_list_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateListResponse>, Integer, Hash)> template_list_with_http_info(opts)`

```ruby
begin
  # List Templates
  data, status_code, headers = api_instance.template_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateListResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | **String** | Which account to return Templates for. Must be a team member. Use `all` to indicate all team members. Defaults to your account. | [optional] |
| `page` | **Integer** | Which page number of the Template List to return. Defaults to `1`. | [optional][default to 1] |
| `page_size` | **Integer** | Number of objects to be returned per page. Must be between `1` and `100`. Default is `20`. | [optional][default to 20] |
| `query` | **String** | String that includes search terms and/or fields to be used to filter the Template objects. | [optional] |

### Return type

[**TemplateListResponse**](TemplateListResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `template_remove_user`

> `<TemplateGetResponse> template_remove_user(template_id, template_remove_user_request)`

Remove User from Template

Removes the specified Account's access to the specified Template.

### Examples

```ruby
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

```

#### Using the `template_remove_user_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateGetResponse>, Integer, Hash)> template_remove_user_with_http_info(template_id, template_remove_user_request)`

```ruby
begin
  # Remove User from Template
  data, status_code, headers = api_instance.template_remove_user_with_http_info(template_id, template_remove_user_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_remove_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The id of the Template to remove the Account&#39;s access to. |  |
| `template_remove_user_request` | [**TemplateRemoveUserRequest**](TemplateRemoveUserRequest.md) |  |  |

### Return type

[**TemplateGetResponse**](TemplateGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `template_update_files`

> `<TemplateUpdateFilesResponse> template_update_files(template_id, template_update_files_request)`

Update Template Files

Overlays a new file with the overlay of an existing template. The new file(s) must:  1. have the same or higher page count 2. the same orientation as the file(s) being replaced.  This will not overwrite or in any way affect the existing template. Both the existing template and new template will be available for use after executing this endpoint. Also note that this will decrement your template quota.  Overlaying new files is asynchronous and a successful call to this endpoint will return 200 OK response if the request passes initial validation checks.  It is recommended that a callback be implemented to listen for the callback event. A `template_created` event will be sent when the files are updated or a `template_error` event will be sent if there was a problem while updating the files. If a callback handler has been configured and the event has not been received within 60 minutes of making the call, check the status of the request in the API dashboard and retry the request if necessary.  If the page orientation or page count is different from the original template document, we will notify you with a `template_error` [callback event](https://app.hellosign.com/api/eventsAndCallbacksWalkthrough).

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TemplateApi.new

data = HelloSign::TemplateUpdateFilesRequest.new
data.file = [File.new("example_signature_request.pdf", "r")]

template_id = "5de8179668f2033afac48da1868d0093bf133266"

begin
  result = api.template_update_files(template_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `template_update_files_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TemplateUpdateFilesResponse>, Integer, Hash)> template_update_files_with_http_info(template_id, template_update_files_request)`

```ruby
begin
  # Update Template Files
  data, status_code, headers = api_instance.template_update_files_with_http_info(template_id, template_update_files_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateUpdateFilesResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TemplateApi->template_update_files_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | **String** | The ID of the template whose files to update. |  |
| `template_update_files_request` | [**TemplateUpdateFilesRequest**](TemplateUpdateFilesRequest.md) |  |  |

### Return type

[**TemplateUpdateFilesResponse**](TemplateUpdateFilesResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

