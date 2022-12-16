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
