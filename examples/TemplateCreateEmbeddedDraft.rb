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
