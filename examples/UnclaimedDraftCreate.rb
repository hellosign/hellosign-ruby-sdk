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
data.file_url = ["https://app.hellosign.com/docs/example_signature_request.pdf"]
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
