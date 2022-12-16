# HelloSign::UnclaimedDraftApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`unclaimed_draft_create`](UnclaimedDraftApi.md#unclaimed_draft_create) | **POST** `/unclaimed_draft/create` | Create Unclaimed Draft |
| [`unclaimed_draft_create_embedded`](UnclaimedDraftApi.md#unclaimed_draft_create_embedded) | **POST** `/unclaimed_draft/create_embedded` | Create Embedded Unclaimed Draft |
| [`unclaimed_draft_create_embedded_with_template`](UnclaimedDraftApi.md#unclaimed_draft_create_embedded_with_template) | **POST** `/unclaimed_draft/create_embedded_with_template` | Create Embedded Unclaimed Draft with Template |
| [`unclaimed_draft_edit_and_resend`](UnclaimedDraftApi.md#unclaimed_draft_edit_and_resend) | **POST** `/unclaimed_draft/edit_and_resend/{signature_request_id}` | Edit and Resend Unclaimed Draft |


## `unclaimed_draft_create`

> `<UnclaimedDraftCreateResponse> unclaimed_draft_create(unclaimed_draft_create_request)`

Create Unclaimed Draft

Creates a new Draft that can be claimed using the claim URL. The first authenticated user to access the URL will claim the Draft and will be shown either the \"Sign and send\" or the \"Request signature\" page with the Draft loaded. Subsequent access to the claim URL will result in a 404.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

signer_1 = HelloSign::SubUnclaimedDraftSigner.new
signer_1.email_address = "jack@example.com"
signer_1.name = "Jack"
signer_1.order = 0

signer_2 = HelloSign::SubUnclaimedDraftSigner.new
signer_2.email_address = "jill@example.com"
signer_2.name = "Jill"
signer_2.order = 1

signing_options = HelloSign::SubSigningOptions.new
signing_options.draw = true
signing_options.type = true
signing_options.upload = true
signing_options.phone = false
signing_options.default_type = "draw"

field_options = HelloSign::SubFieldOptions.new
field_options.date_format = "DD - MM - YYYY"

data = HelloSign::UnclaimedDraftCreateRequest.new
data.subject = "The NDA we talked about"
data.type = "request_signature"
data.message = "Please sign this NDA and then we can discuss more. Let me know if you have any questions."
data.signers = [signer_1, signer_2]
data.cc_email_addresses = [
  "lawyer@hellosign.com",
  "lawyer@example.com",
]
data.file = [File.new("example_signature_request.pdf", "r")]
data.metadata = {
  custom_id: 1234,
  custom_text: "NDA #9",
}
data.signing_options = signing_options
data.field_options = field_options
data.test_mode = true

begin
  result = api.unclaimed_draft_create(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `unclaimed_draft_create_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<UnclaimedDraftCreateResponse>, Integer, Hash)> unclaimed_draft_create_with_http_info(unclaimed_draft_create_request)`

```ruby
begin
  # Create Unclaimed Draft
  data, status_code, headers = api_instance.unclaimed_draft_create_with_http_info(unclaimed_draft_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UnclaimedDraftCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling UnclaimedDraftApi->unclaimed_draft_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `unclaimed_draft_create_request` | [**UnclaimedDraftCreateRequest**](UnclaimedDraftCreateRequest.md) |  |  |

### Return type

[**UnclaimedDraftCreateResponse**](UnclaimedDraftCreateResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `unclaimed_draft_create_embedded`

> `<UnclaimedDraftCreateResponse> unclaimed_draft_create_embedded(unclaimed_draft_create_embedded_request)`

Create Embedded Unclaimed Draft

Creates a new Draft that can be claimed and used in an embedded iFrame. The first authenticated user to access the URL will claim the Draft and will be shown the \"Request signature\" page with the Draft loaded. Subsequent access to the claim URL will result in a `404`. For this embedded endpoint the `requester_email_address` parameter is required.  **NOTE**: Embedded unclaimed drafts can only be accessed in embedded iFrames whereas normal drafts can be used and accessed on Dropbox Sign.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

data = HelloSign::UnclaimedDraftCreateEmbeddedRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.file = [File.new("example_signature_request.pdf", "r")]
data.requester_email_address = "jack@hellosign.com"
data.test_mode = true

begin
  result = api.unclaimed_draft_create_embedded(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `unclaimed_draft_create_embedded_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<UnclaimedDraftCreateResponse>, Integer, Hash)> unclaimed_draft_create_embedded_with_http_info(unclaimed_draft_create_embedded_request)`

```ruby
begin
  # Create Embedded Unclaimed Draft
  data, status_code, headers = api_instance.unclaimed_draft_create_embedded_with_http_info(unclaimed_draft_create_embedded_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UnclaimedDraftCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling UnclaimedDraftApi->unclaimed_draft_create_embedded_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `unclaimed_draft_create_embedded_request` | [**UnclaimedDraftCreateEmbeddedRequest**](UnclaimedDraftCreateEmbeddedRequest.md) |  |  |

### Return type

[**UnclaimedDraftCreateResponse**](UnclaimedDraftCreateResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `unclaimed_draft_create_embedded_with_template`

> `<UnclaimedDraftCreateResponse> unclaimed_draft_create_embedded_with_template(unclaimed_draft_create_embedded_with_template_request)`

Create Embedded Unclaimed Draft with Template

Creates a new Draft with a previously saved template(s) that can be claimed and used in an embedded iFrame. The first authenticated user to access the URL will claim the Draft and will be shown the \"Request signature\" page with the Draft loaded. Subsequent access to the claim URL will result in a `404`. For this embedded endpoint the `requester_email_address` parameter is required.  **NOTE**: Embedded unclaimed drafts can only be accessed in embedded iFrames whereas normal drafts can be used and accessed on Dropbox Sign.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

signer_1 = HelloSign::SubUnclaimedDraftTemplateSigner.new
signer_1.role = "Client"
signer_1.name = "George"
signer_1.email_address = "george@example.com"

cc_1 = HelloSign::SubCC.new
cc_1.role = "Accounting"
cc_1.email_address = "accounting@example.com"

data = HelloSign::UnclaimedDraftCreateEmbeddedWithTemplateRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.template_ids = ["61a832ff0d8423f91d503e76bfbcc750f7417c78"]
data.requester_email_address = "jack@hellosign.com"
data.signers = [signer_1]
data.ccs = [cc_1]
data.test_mode = true

begin
  result = api.unclaimed_draft_create_embedded_with_template(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `unclaimed_draft_create_embedded_with_template_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<UnclaimedDraftCreateResponse>, Integer, Hash)> unclaimed_draft_create_embedded_with_template_with_http_info(unclaimed_draft_create_embedded_with_template_request)`

```ruby
begin
  # Create Embedded Unclaimed Draft with Template
  data, status_code, headers = api_instance.unclaimed_draft_create_embedded_with_template_with_http_info(unclaimed_draft_create_embedded_with_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UnclaimedDraftCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling UnclaimedDraftApi->unclaimed_draft_create_embedded_with_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `unclaimed_draft_create_embedded_with_template_request` | [**UnclaimedDraftCreateEmbeddedWithTemplateRequest**](UnclaimedDraftCreateEmbeddedWithTemplateRequest.md) |  |  |

### Return type

[**UnclaimedDraftCreateResponse**](UnclaimedDraftCreateResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `unclaimed_draft_edit_and_resend`

> `<UnclaimedDraftCreateResponse> unclaimed_draft_edit_and_resend(signature_request_id, unclaimed_draft_edit_and_resend_request)`

Edit and Resend Unclaimed Draft

Creates a new signature request from an embedded request that can be edited prior to being sent to the recipients. Parameter `test_mode` can be edited prior to request. Signers can be edited in embedded editor. Requester's email address will remain unchanged if `requester_email_address` parameter is not set.  **NOTE**: Embedded unclaimed drafts can only be accessed in embedded iFrames whereas normal drafts can be used and accessed on Dropbox Sign.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::UnclaimedDraftApi.new

data = HelloSign::UnclaimedDraftEditAndResendRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.test_mode = true

signature_request_id = "2f9781e1a83jdja934d808c153c2e1d3df6f8f2f"

begin
  result = api.unclaimed_draft_edit_and_resend(signature_request_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `unclaimed_draft_edit_and_resend_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<UnclaimedDraftCreateResponse>, Integer, Hash)> unclaimed_draft_edit_and_resend_with_http_info(signature_request_id, unclaimed_draft_edit_and_resend_request)`

```ruby
begin
  # Edit and Resend Unclaimed Draft
  data, status_code, headers = api_instance.unclaimed_draft_edit_and_resend_with_http_info(signature_request_id, unclaimed_draft_edit_and_resend_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UnclaimedDraftCreateResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling UnclaimedDraftApi->unclaimed_draft_edit_and_resend_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The ID of the signature request to edit and resend. |  |
| `unclaimed_draft_edit_and_resend_request` | [**UnclaimedDraftEditAndResendRequest**](UnclaimedDraftEditAndResendRequest.md) |  |  |

### Return type

[**UnclaimedDraftCreateResponse**](UnclaimedDraftCreateResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

