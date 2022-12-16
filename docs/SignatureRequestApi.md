# HelloSign::SignatureRequestApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`signature_request_bulk_create_embedded_with_template`](SignatureRequestApi.md#signature_request_bulk_create_embedded_with_template) | **POST** `/signature_request/bulk_create_embedded_with_template` | Embedded Bulk Send with Template |
| [`signature_request_bulk_send_with_template`](SignatureRequestApi.md#signature_request_bulk_send_with_template) | **POST** `/signature_request/bulk_send_with_template` | Bulk Send with Template |
| [`signature_request_cancel`](SignatureRequestApi.md#signature_request_cancel) | **POST** `/signature_request/cancel/{signature_request_id}` | Cancel Incomplete Signature Request |
| [`signature_request_create_embedded`](SignatureRequestApi.md#signature_request_create_embedded) | **POST** `/signature_request/create_embedded` | Create Embedded Signature Request |
| [`signature_request_create_embedded_with_template`](SignatureRequestApi.md#signature_request_create_embedded_with_template) | **POST** `/signature_request/create_embedded_with_template` | Create Embedded Signature Request with Template |
| [`signature_request_files`](SignatureRequestApi.md#signature_request_files) | **GET** `/signature_request/files/{signature_request_id}` | Download Files |
| [`signature_request_files_as_data_uri`](SignatureRequestApi.md#signature_request_files_as_data_uri) | **GET** `/signature_request/files_as_data_uri/{signature_request_id}` | Download Files as Data Uri |
| [`signature_request_files_as_file_url`](SignatureRequestApi.md#signature_request_files_as_file_url) | **GET** `/signature_request/files_as_file_url/{signature_request_id}` | Download Files as File Url |
| [`signature_request_get`](SignatureRequestApi.md#signature_request_get) | **GET** `/signature_request/{signature_request_id}` | Get Signature Request |
| [`signature_request_list`](SignatureRequestApi.md#signature_request_list) | **GET** `/signature_request/list` | List Signature Requests |
| [`signature_request_release_hold`](SignatureRequestApi.md#signature_request_release_hold) | **POST** `/signature_request/release_hold/{signature_request_id}` | Release On-Hold Signature Request |
| [`signature_request_remind`](SignatureRequestApi.md#signature_request_remind) | **POST** `/signature_request/remind/{signature_request_id}` | Send Request Reminder |
| [`signature_request_remove`](SignatureRequestApi.md#signature_request_remove) | **POST** `/signature_request/remove/{signature_request_id}` | Remove Signature Request Access |
| [`signature_request_send`](SignatureRequestApi.md#signature_request_send) | **POST** `/signature_request/send` | Send Signature Request |
| [`signature_request_send_with_template`](SignatureRequestApi.md#signature_request_send_with_template) | **POST** `/signature_request/send_with_template` | Send with Template |
| [`signature_request_update`](SignatureRequestApi.md#signature_request_update) | **POST** `/signature_request/update/{signature_request_id}` | Update Signature Request |


## `signature_request_bulk_create_embedded_with_template`

> `<BulkSendJobSendResponse> signature_request_bulk_create_embedded_with_template(signature_request_bulk_create_embedded_with_template_request)`

Embedded Bulk Send with Template

Creates BulkSendJob which sends up to 250 SignatureRequests in bulk based off of the provided Template(s) specified with the `template_ids` parameter to be signed in an embedded iFrame. These embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on Dropbox Sign.  **NOTE**: Only available for Standard plan and higher.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_list_1_signer = HelloSign::SubSignatureRequestTemplateSigner.new
signer_list_1_signer.role = "Client"
signer_list_1_signer.name = "George"
signer_list_1_signer.email_address = "george@example.com"
signer_list_1_signer.pin = "d79a3td"

signer_list_1_custom_fields = HelloSign::SubBulkSignerListCustomField.new
signer_list_1_custom_fields.name = "company"
signer_list_1_custom_fields.value = "ABC Corp"

signer_list_1 = HelloSign::SubBulkSignerList.new
signer_list_1.signers = [signer_list_1_signer]
signer_list_1.custom_fields = [signer_list_1_custom_fields]

signer_list_2_signer = HelloSign::SubSignatureRequestTemplateSigner.new
signer_list_2_signer.role = "Client"
signer_list_2_signer.name = "Mary"
signer_list_2_signer.email_address = "mary@example.com"
signer_list_2_signer.pin = "gd9as5b"

signer_list_2_custom_fields = HelloSign::SubBulkSignerListCustomField.new
signer_list_2_custom_fields.name = "company"
signer_list_2_custom_fields.value = "123 LLC"

signer_list_2 = HelloSign::SubBulkSignerList.new
signer_list_2.signers = [signer_list_2_signer]
signer_list_2.custom_fields = [signer_list_2_custom_fields]

cc_1 = HelloSign::SubCC.new
cc_1.role = "Accounting"
cc_1.email_address = "accounting@example.com"

data = HelloSign::SignatureRequestBulkCreateEmbeddedWithTemplateRequest.new
data.client_id = "1a659d9ad95bccd307ecad78d72192f8"
data.template_ids = ["c26b8a16784a872da37ea946b9ddec7c1e11dff6"]
data.subject = "Purchase Order"
data.message = "Glad we could come to an agreement."
data.signer_list = [signer_list_1, signer_list_2]
data.ccs = [cc_1]
data.test_mode = true

begin
  result = api.signature_request_bulk_create_embedded_with_template(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_bulk_create_embedded_with_template_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<BulkSendJobSendResponse>, Integer, Hash)> signature_request_bulk_create_embedded_with_template_with_http_info(signature_request_bulk_create_embedded_with_template_request)`

```ruby
begin
  # Embedded Bulk Send with Template
  data, status_code, headers = api_instance.signature_request_bulk_create_embedded_with_template_with_http_info(signature_request_bulk_create_embedded_with_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkSendJobSendResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_bulk_create_embedded_with_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_bulk_create_embedded_with_template_request` | [**SignatureRequestBulkCreateEmbeddedWithTemplateRequest**](SignatureRequestBulkCreateEmbeddedWithTemplateRequest.md) |  |  |

### Return type

[**BulkSendJobSendResponse**](BulkSendJobSendResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_bulk_send_with_template`

> `<BulkSendJobSendResponse> signature_request_bulk_send_with_template(signature_request_bulk_send_with_template_request)`

Bulk Send with Template

Creates BulkSendJob which sends up to 250 SignatureRequests in bulk based off of the provided Template(s) specified with the `template_ids` parameter.  **NOTE**: Only available for Standard plan and higher.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_list_1_signer = HelloSign::SubSignatureRequestTemplateSigner.new
signer_list_1_signer.role = "Client"
signer_list_1_signer.name = "George"
signer_list_1_signer.email_address = "george@example.com"
signer_list_1_signer.pin = "d79a3td"

signer_list_1_custom_fields = HelloSign::SubBulkSignerListCustomField.new
signer_list_1_custom_fields.name = "company"
signer_list_1_custom_fields.value = "ABC Corp"

signer_list_1 = HelloSign::SubBulkSignerList.new
signer_list_1.signers = [signer_list_1_signer]
signer_list_1.custom_fields = [signer_list_1_custom_fields]

signer_list_2_signer = HelloSign::SubSignatureRequestTemplateSigner.new
signer_list_2_signer.role = "Client"
signer_list_2_signer.name = "Mary"
signer_list_2_signer.email_address = "mary@example.com"
signer_list_2_signer.pin = "gd9as5b"

signer_list_2_custom_fields = HelloSign::SubBulkSignerListCustomField.new
signer_list_2_custom_fields.name = "company"
signer_list_2_custom_fields.value = "123 LLC"

signer_list_2 = HelloSign::SubBulkSignerList.new
signer_list_2.signers = [signer_list_2_signer]
signer_list_2.custom_fields = [signer_list_2_custom_fields]

cc_1 = HelloSign::SubCC.new
cc_1.role = "Accounting"
cc_1.email_address = "accounting@example.com"

data = HelloSign::SignatureRequestBulkSendWithTemplateRequest.new
data.template_ids = ["c26b8a16784a872da37ea946b9ddec7c1e11dff6"]
data.subject = "Purchase Order"
data.message = "Glad we could come to an agreement."
data.signer_list = [signer_list_1, signer_list_2]
data.ccs = [cc_1]
data.test_mode = true

begin
  result = api.signature_request_bulk_send_with_template(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_bulk_send_with_template_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<BulkSendJobSendResponse>, Integer, Hash)> signature_request_bulk_send_with_template_with_http_info(signature_request_bulk_send_with_template_request)`

```ruby
begin
  # Bulk Send with Template
  data, status_code, headers = api_instance.signature_request_bulk_send_with_template_with_http_info(signature_request_bulk_send_with_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkSendJobSendResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_bulk_send_with_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_bulk_send_with_template_request` | [**SignatureRequestBulkSendWithTemplateRequest**](SignatureRequestBulkSendWithTemplateRequest.md) |  |  |

### Return type

[**BulkSendJobSendResponse**](BulkSendJobSendResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_cancel`

> `signature_request_cancel(signature_request_id)`

Cancel Incomplete Signature Request

Cancels an incomplete signature request. This action is **not reversible**.  The request will be canceled and signers will no longer be able to sign. If they try to access the signature request they will receive a HTTP 410 status code indicating that the resource has been deleted. Cancelation is asynchronous and a successful call to this endpoint will return an empty 200 OK response if the signature request is eligible to be canceled and has been successfully queued.  This 200 OK response does not indicate a successful cancelation of the signature request itself. The cancelation is confirmed via the `signature_request_canceled` event. It is recommended that a  [callback handler](/api/reference/tag/Callbacks-and-Events) be implemented to listen for the `signature_request_canceled` event. This callback will be sent only when the cancelation has completed successfully. If a callback handler has been configured and the event has not been received within 60 minutes of making the call, check the status of the request in the [API Dashboard](https://app.hellosign.com/apidashboard) and retry the cancelation if necessary.  To be eligible for cancelation, a signature request must have been sent successfully, must not yet have been signed by all signers, and you must either be the sender or own the API app under which it was sent. A partially signed signature request can be canceled.  **NOTE**: To remove your access to a completed signature request, use the endpoint: `POST /signature_request/remove/[:signature_request_id]`.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "2f9781e1a8e2045224d808c153c2e1d3df6f8f2f"

begin
  result = api.signature_request_cancel(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_cancel_with_http_info` variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> `<Array(nil, Integer, Hash)> signature_request_cancel_with_http_info(signature_request_id)`

```ruby
begin
  # Cancel Incomplete Signature Request
  data, status_code, headers = api_instance.signature_request_cancel_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_cancel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the incomplete SignatureRequest to cancel. |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_create_embedded`

> `<SignatureRequestGetResponse> signature_request_create_embedded(signature_request_create_embedded_request)`

Create Embedded Signature Request

Creates a new SignatureRequest with the submitted documents to be signed in an embedded iFrame. If form_fields_per_document is not specified, a signature page will be affixed where all signers will be required to add their signature, signifying their agreement to all contained documents. <u>Note</u> that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on Dropbox Sign.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_1 = HelloSign::SubSignatureRequestSigner.new
signer_1.email_address = "jack@example.com"
signer_1.name = "Jack"
signer_1.order = 0

signer_2 = HelloSign::SubSignatureRequestSigner.new
signer_2.email_address = "jill@example.com"
signer_2.name = "Jill"
signer_2.order = 1

signing_options = HelloSign::SubSigningOptions.new
signing_options.draw = true
signing_options.type = true
signing_options.upload = true
signing_options.phone = true
signing_options.default_type = "draw"

data = HelloSign::SignatureRequestCreateEmbeddedRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.title = "NDA with Acme Co."
data.subject = "The NDA we talked about"
data.message = "Please sign this NDA and then we can discuss more. Let me know if you have any questions."
data.signers = [signer_1, signer_2]
data.cc_email_addresses = ["lawyer@hellosign.com", "lawyer@example.com"]
data.file = [File.new("example_signature_request.pdf", "r")]
data.signing_options = signing_options
data.test_mode = true

begin
  result = api.signature_request_create_embedded(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_create_embedded_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_create_embedded_with_http_info(signature_request_create_embedded_request)`

```ruby
begin
  # Create Embedded Signature Request
  data, status_code, headers = api_instance.signature_request_create_embedded_with_http_info(signature_request_create_embedded_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_create_embedded_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_create_embedded_request` | [**SignatureRequestCreateEmbeddedRequest**](SignatureRequestCreateEmbeddedRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_create_embedded_with_template`

> `<SignatureRequestGetResponse> signature_request_create_embedded_with_template(signature_request_create_embedded_with_template_request)`

Create Embedded Signature Request with Template

Creates a new SignatureRequest based on the given Template(s) to be signed in an embedded iFrame. <u>Note</u> that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on Dropbox Sign.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_1 = HelloSign::SubSignatureRequestTemplateSigner.new
signer_1.role = "Client"
signer_1.email_address = "jack@example.com"
signer_1.name = "Jack"

signing_options = HelloSign::SubSigningOptions.new
signing_options.draw = true
signing_options.type = true
signing_options.upload = true
signing_options.phone = true
signing_options.default_type = "draw"

data = HelloSign::SignatureRequestCreateEmbeddedWithTemplateRequest.new
data.client_id = "ec64a202072370a737edf4a0eb7f4437"
data.template_ids = ["c26b8a16784a872da37ea946b9ddec7c1e11dff6"]
data.subject = "Purchase Order"
data.message = "Glad we could come to an agreement."
data.signers = [signer_1]
data.signing_options = signing_options
data.test_mode = true

begin
  result = api.signature_request_create_embedded_with_template(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_create_embedded_with_template_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_create_embedded_with_template_with_http_info(signature_request_create_embedded_with_template_request)`

```ruby
begin
  # Create Embedded Signature Request with Template
  data, status_code, headers = api_instance.signature_request_create_embedded_with_template_with_http_info(signature_request_create_embedded_with_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_create_embedded_with_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_create_embedded_with_template_request` | [**SignatureRequestCreateEmbeddedWithTemplateRequest**](SignatureRequestCreateEmbeddedWithTemplateRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_files`

> `File signature_request_files(signature_request_id, opts)`

Download Files

Obtain a copy of the current documents specified by the `signature_request_id` parameter. Returns a PDF or ZIP file.  If the files are currently being prepared, a status code of `409` will be returned instead.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "fa5c8a0b0f492d768749333ad6fcc214c111e967"

begin
  file_bin = api.signature_request_files(signature_request_id)
  FileUtils.cp(file_bin.path, "path/to/file.pdf")
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_files_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(File, Integer, Hash)> signature_request_files_with_http_info(signature_request_id, opts)`

```ruby
begin
  # Download Files
  data, status_code, headers = api_instance.signature_request_files_with_http_info(signature_request_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_files_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to retrieve. |  |
| `file_type` | **String** | Set to `pdf` for a single merged document or `zip` for a collection of individual documents. | [optional][default to &#39;pdf&#39;] |

### Return type

**File**

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/pdf, application/zip, application/json


## `signature_request_files_as_data_uri`

> `<FileResponseDataUri> signature_request_files_as_data_uri(signature_request_id)`

Download Files as Data Uri

Obtain a copy of the current documents specified by the `signature_request_id` parameter. Returns a JSON object with a `data_uri` representing the base64 encoded file (PDFs only).  If the files are currently being prepared, a status code of `409` will be returned instead.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "fa5c8a0b0f492d768749333ad6fcc214c111e967"

begin
  result = api.signature_request_files_as_data_uri(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_files_as_data_uri_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<FileResponseDataUri>, Integer, Hash)> signature_request_files_as_data_uri_with_http_info(signature_request_id)`

```ruby
begin
  # Download Files as Data Uri
  data, status_code, headers = api_instance.signature_request_files_as_data_uri_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FileResponseDataUri>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_files_as_data_uri_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to retrieve. |  |

### Return type

[**FileResponseDataUri**](FileResponseDataUri.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_files_as_file_url`

> `<FileResponse> signature_request_files_as_file_url(signature_request_id)`

Download Files as File Url

Obtain a copy of the current documents specified by the `signature_request_id` parameter. Returns a JSON object with a url to the file (PDFs only).  If the files are currently being prepared, a status code of `409` will be returned instead.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "fa5c8a0b0f492d768749333ad6fcc214c111e967"

begin
  result = api.signature_request_files_as_file_url(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_files_as_file_url_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<FileResponse>, Integer, Hash)> signature_request_files_as_file_url_with_http_info(signature_request_id)`

```ruby
begin
  # Download Files as File Url
  data, status_code, headers = api_instance.signature_request_files_as_file_url_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FileResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_files_as_file_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to retrieve. |  |

### Return type

[**FileResponse**](FileResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_get`

> `<SignatureRequestGetResponse> signature_request_get(signature_request_id)`

Get Signature Request

Returns the status of the SignatureRequest specified by the `signature_request_id` parameter.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "fa5c8a0b0f492d768749333ad6fcc214c111e967"

begin
  result = api.signature_request_get(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_get_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_get_with_http_info(signature_request_id)`

```ruby
begin
  # Get Signature Request
  data, status_code, headers = api_instance.signature_request_get_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to retrieve. |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_list`

> `<SignatureRequestListResponse> signature_request_list(opts)`

List Signature Requests

Returns a list of SignatureRequests that you can access. This includes SignatureRequests you have sent as well as received, but not ones that you have been CCed on.  Take a look at our [search guide](/api/reference/search/) to learn more about querying signature requests.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

account_id = null
page = 1

begin
  result = api.signature_request_list({account_id: account_id, page: page})
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_list_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestListResponse>, Integer, Hash)> signature_request_list_with_http_info(opts)`

```ruby
begin
  # List Signature Requests
  data, status_code, headers = api_instance.signature_request_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestListResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | **String** | Which account to return SignatureRequests for. Must be a team member. Use `all` to indicate all team members. Defaults to your account. | [optional] |
| `page` | **Integer** | Which page number of the SignatureRequest List to return. Defaults to `1`. | [optional][default to 1] |
| `page_size` | **Integer** | Number of objects to be returned per page. Must be between `1` and `100`. Default is `20`. | [optional][default to 20] |
| `query` | **String** | String that includes search terms and/or fields to be used to filter the SignatureRequest objects. | [optional] |

### Return type

[**SignatureRequestListResponse**](SignatureRequestListResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_release_hold`

> `<SignatureRequestGetResponse> signature_request_release_hold(signature_request_id)`

Release On-Hold Signature Request

Releases a held SignatureRequest that was claimed and prepared from an [UnclaimedDraft](/api/reference/tag/Unclaimed-Draft). The owner of the Draft must indicate at Draft creation that the SignatureRequest created from the Draft should be held. Releasing the SignatureRequest will send requests to all signers.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "2f9781e1a8e2045224d808c153c2e1d3df6f8f2f"

begin
  result = api.signature_request_release_hold(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_release_hold_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_release_hold_with_http_info(signature_request_id)`

```ruby
begin
  # Release On-Hold Signature Request
  data, status_code, headers = api_instance.signature_request_release_hold_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_release_hold_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to release. |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_remind`

> `<SignatureRequestGetResponse> signature_request_remind(signature_request_id, signature_request_remind_request)`

Send Request Reminder

Sends an email to the signer reminding them to sign the signature request. You cannot send a reminder within 1 hour of the last reminder that was sent. This includes manual AND automatic reminders.  **NOTE**: This action can **not** be used with embedded signature requests.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

data = HelloSign::SignatureRequestRemindRequest.new
data.email_address = "john@example.com"

signature_request_id = "2f9781e1a8e2045224d808c153c2e1d3df6f8f2f"

begin
  result = api.signature_request_remind(signature_request_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_remind_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_remind_with_http_info(signature_request_id, signature_request_remind_request)`

```ruby
begin
  # Send Request Reminder
  data, status_code, headers = api_instance.signature_request_remind_with_http_info(signature_request_id, signature_request_remind_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_remind_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to send a reminder for. |  |
| `signature_request_remind_request` | [**SignatureRequestRemindRequest**](SignatureRequestRemindRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `signature_request_remove`

> `signature_request_remove(signature_request_id)`

Remove Signature Request Access

Removes your access to a completed signature request. This action is **not reversible**.  The signature request must be fully executed by all parties (signed or declined to sign). Other parties will continue to maintain access to the completed signature request document(s).  Unlike /signature_request/cancel, this endpoint is synchronous and your access will be immediately removed. Upon successful removal, this endpoint will return a 200 OK response.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signature_request_id = "2f9781e1a8e2045224d808c153c2e1d3df6f8f2f"

begin
  result = api.signature_request_remove(signature_request_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_remove_with_http_info` variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> `<Array(nil, Integer, Hash)> signature_request_remove_with_http_info(signature_request_id)`

```ruby
begin
  # Remove Signature Request Access
  data, status_code, headers = api_instance.signature_request_remove_with_http_info(signature_request_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_remove_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to remove. |  |

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `signature_request_send`

> `<SignatureRequestGetResponse> signature_request_send(signature_request_send_request)`

Send Signature Request

Creates and sends a new SignatureRequest with the submitted documents. If `form_fields_per_document` is not specified, a signature page will be affixed where all signers will be required to add their signature, signifying their agreement to all contained documents.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_1 = HelloSign::SubSignatureRequestSigner.new
signer_1.email_address = "jack@example.com"
signer_1.name = "Jack"
signer_1.order = 0

signer_2 = HelloSign::SubSignatureRequestSigner.new
signer_2.email_address = "jill@example.com"
signer_2.name = "Jill"
signer_2.order = 1

signing_options = HelloSign::SubSigningOptions.new
signing_options.draw = true
signing_options.type = true
signing_options.upload = true
signing_options.phone = true
signing_options.default_type = "draw"

field_options = HelloSign::SubFieldOptions.new
field_options.date_format = "DD - MM - YYYY"

data = HelloSign::SignatureRequestSendRequest.new
data.title = "NDA with Acme Co."
data.subject = "The NDA we talked about"
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
  result = api.signature_request_send(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_send_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_send_with_http_info(signature_request_send_request)`

```ruby
begin
  # Send Signature Request
  data, status_code, headers = api_instance.signature_request_send_with_http_info(signature_request_send_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_send_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_send_request` | [**SignatureRequestSendRequest**](SignatureRequestSendRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_send_with_template`

> `<SignatureRequestGetResponse> signature_request_send_with_template(signature_request_send_with_template_request)`

Send with Template

Creates and sends a new SignatureRequest based off of the Template(s) specified with the `template_ids` parameter.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

signer_1 = HelloSign::SubSignatureRequestTemplateSigner.new
signer_1.role = "Client"
signer_1.email_address = "george@example.com"
signer_1.name = "George"

cc_1 = HelloSign::SubCC.new
cc_1.role = "Accounting"
cc_1.email_address = "accounting@example.com"

custom_field_1 = HelloSign::SubCustomField.new
custom_field_1.name = "Cost"
custom_field_1.value = "$20,000"
custom_field_1.editor = "Client"
custom_field_1.required = true

signing_options = HelloSign::SubSigningOptions.new
signing_options.draw = true
signing_options.type = true
signing_options.upload = true
signing_options.phone = false
signing_options.default_type = "draw"

data = HelloSign::SignatureRequestSendWithTemplateRequest.new
data.template_ids = ["c26b8a16784a872da37ea946b9ddec7c1e11dff6"]
data.subject = "Purchase Order"
data.message = "Glad we could come to an agreement."
data.signers = [signer_1]
data.ccs = [cc_1]
data.custom_fields = [custom_field_1]
data.signing_options = signing_options
data.test_mode = true

begin
  result = api.signature_request_send_with_template(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_send_with_template_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_send_with_template_with_http_info(signature_request_send_with_template_request)`

```ruby
begin
  # Send with Template
  data, status_code, headers = api_instance.signature_request_send_with_template_with_http_info(signature_request_send_with_template_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_send_with_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_send_with_template_request` | [**SignatureRequestSendWithTemplateRequest**](SignatureRequestSendWithTemplateRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## `signature_request_update`

> `<SignatureRequestGetResponse> signature_request_update(signature_request_id, signature_request_update_request)`

Update Signature Request

Updates the email address and/or the name for a given signer on a signature request. You can listen for the `signature_request_email_bounce` event on your app or account to detect bounced emails, and respond with this method.  **NOTE**: This action cannot be performed on a signature request with an appended signature page.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::SignatureRequestApi.new

data = HelloSign::SignatureRequestUpdateRequest.new
data.email_address = "john@example.com"
data.signature_id = "78caf2a1d01cd39cea2bc1cbb340dac3"

signature_request_id = "2f9781e1a8e2045224d808c153c2e1d3df6f8f2f"

begin
  result = api.signature_request_update(signature_request_id, data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `signature_request_update_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<SignatureRequestGetResponse>, Integer, Hash)> signature_request_update_with_http_info(signature_request_id, signature_request_update_request)`

```ruby
begin
  # Update Signature Request
  data, status_code, headers = api_instance.signature_request_update_with_http_info(signature_request_id, signature_request_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureRequestGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling SignatureRequestApi->signature_request_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | **String** | The id of the SignatureRequest to update. |  |
| `signature_request_update_request` | [**SignatureRequestUpdateRequest**](SignatureRequestUpdateRequest.md) |  |  |

### Return type

[**SignatureRequestGetResponse**](SignatureRequestGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

