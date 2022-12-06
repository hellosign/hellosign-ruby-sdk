# hellosign-ruby-sdk

HelloSign - the Ruby gem for the Dropbox Sign API

Dropbox Sign v3 API

## ⚠ This package is not yet ready for production use ⚠

We are working hard on getting this package ready, but it is not there, yet!

You should think twice before using package on anything critical.

The interfaces may change without warning. Backwards compatibility is not yet
guaranteed nor implied!

## Contributing

This repo is no longer accepting new issues or Pull Requests. All issues or
Pull Requests *must* be opened against the
[hellosign/hellosign-openapi](https://github.com/hellosign/hellosign-openapi) repo!

### Changes to the SDK code

You must make SDK code changes in the mustache file within the `templates`
directory that corresponds to the file you want updated.

This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 3.0.0
- Package version: 6.0.0-beta22.23
- Build package: org.openapitools.codegen.languages.RubyClientCodegen

## Installation

### Install gem
```shell
gem install hellosign-ruby-sdk --pre
```

### Build a gem

To build the Ruby code into a gem:

```shell
gem build hellosign-ruby-sdk.gemspec
```

Then either install the gem locally:

```shell
gem install ./hellosign-ruby-sdk-6.0.0-beta22.23.gem
```

(for development, run `gem install --dev ./hellosign-ruby-sdk-6.0.0-beta22.23.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'hellosign-ruby-sdk', '~> 6.0.0-beta22.23'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'hellosign-ruby-sdk', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:


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


## Documentation for API Endpoints

All URIs are relative to *https://api.hellosign.com/v3*

|Class | Method | HTTP request | Description|
|------------ | ------------- | ------------- | -------------|
|*HelloSign::AccountApi* | [**account_create**](docs/AccountApi.md#account_create) | **POST** /account/create | Create Account |
|*HelloSign::AccountApi* | [**account_get**](docs/AccountApi.md#account_get) | **GET** /account | Get Account |
|*HelloSign::AccountApi* | [**account_update**](docs/AccountApi.md#account_update) | **PUT** /account | Update Account |
|*HelloSign::AccountApi* | [**account_verify**](docs/AccountApi.md#account_verify) | **POST** /account/verify | Verify Account |
|*HelloSign::ApiAppApi* | [**api_app_create**](docs/ApiAppApi.md#api_app_create) | **POST** /api_app | Create API App |
|*HelloSign::ApiAppApi* | [**api_app_delete**](docs/ApiAppApi.md#api_app_delete) | **DELETE** /api_app/{client_id} | Delete API App |
|*HelloSign::ApiAppApi* | [**api_app_get**](docs/ApiAppApi.md#api_app_get) | **GET** /api_app/{client_id} | Get API App |
|*HelloSign::ApiAppApi* | [**api_app_list**](docs/ApiAppApi.md#api_app_list) | **GET** /api_app/list | List API Apps |
|*HelloSign::ApiAppApi* | [**api_app_update**](docs/ApiAppApi.md#api_app_update) | **PUT** /api_app/{client_id} | Update API App |
|*HelloSign::BulkSendJobApi* | [**bulk_send_job_get**](docs/BulkSendJobApi.md#bulk_send_job_get) | **GET** /bulk_send_job/{bulk_send_job_id} | Get Bulk Send Job |
|*HelloSign::BulkSendJobApi* | [**bulk_send_job_list**](docs/BulkSendJobApi.md#bulk_send_job_list) | **GET** /bulk_send_job/list | List Bulk Send Jobs |
|*HelloSign::EmbeddedApi* | [**embedded_edit_url**](docs/EmbeddedApi.md#embedded_edit_url) | **POST** /embedded/edit_url/{template_id} | Get Embedded Template Edit URL |
|*HelloSign::EmbeddedApi* | [**embedded_sign_url**](docs/EmbeddedApi.md#embedded_sign_url) | **GET** /embedded/sign_url/{signature_id} | Get Embedded Sign URL |
|*HelloSign::OAuthApi* | [**oauth_token_generate**](docs/OAuthApi.md#oauth_token_generate) | **POST** /oauth/token | OAuth Token Generate |
|*HelloSign::OAuthApi* | [**oauth_token_refresh**](docs/OAuthApi.md#oauth_token_refresh) | **POST** /oauth/token?refresh | OAuth Token Refresh |
|*HelloSign::ReportApi* | [**report_create**](docs/ReportApi.md#report_create) | **POST** /report/create | Create Report |
|*HelloSign::SignatureRequestApi* | [**signature_request_bulk_create_embedded_with_template**](docs/SignatureRequestApi.md#signature_request_bulk_create_embedded_with_template) | **POST** /signature_request/bulk_create_embedded_with_template | Embedded Bulk Send with Template |
|*HelloSign::SignatureRequestApi* | [**signature_request_bulk_send_with_template**](docs/SignatureRequestApi.md#signature_request_bulk_send_with_template) | **POST** /signature_request/bulk_send_with_template | Bulk Send with Template |
|*HelloSign::SignatureRequestApi* | [**signature_request_cancel**](docs/SignatureRequestApi.md#signature_request_cancel) | **POST** /signature_request/cancel/{signature_request_id} | Cancel Incomplete Signature Request |
|*HelloSign::SignatureRequestApi* | [**signature_request_create_embedded**](docs/SignatureRequestApi.md#signature_request_create_embedded) | **POST** /signature_request/create_embedded | Create Embedded Signature Request |
|*HelloSign::SignatureRequestApi* | [**signature_request_create_embedded_with_template**](docs/SignatureRequestApi.md#signature_request_create_embedded_with_template) | **POST** /signature_request/create_embedded_with_template | Create Embedded Signature Request with Template |
|*HelloSign::SignatureRequestApi* | [**signature_request_files**](docs/SignatureRequestApi.md#signature_request_files) | **GET** /signature_request/files/{signature_request_id} | Download Files |
|*HelloSign::SignatureRequestApi* | [**signature_request_files_as_data_uri**](docs/SignatureRequestApi.md#signature_request_files_as_data_uri) | **GET** /signature_request/files_as_data_uri/{signature_request_id} | Download Files as Data Uri |
|*HelloSign::SignatureRequestApi* | [**signature_request_files_as_file_url**](docs/SignatureRequestApi.md#signature_request_files_as_file_url) | **GET** /signature_request/files_as_file_url/{signature_request_id} | Download Files as File Url |
|*HelloSign::SignatureRequestApi* | [**signature_request_get**](docs/SignatureRequestApi.md#signature_request_get) | **GET** /signature_request/{signature_request_id} | Get Signature Request |
|*HelloSign::SignatureRequestApi* | [**signature_request_list**](docs/SignatureRequestApi.md#signature_request_list) | **GET** /signature_request/list | List Signature Requests |
|*HelloSign::SignatureRequestApi* | [**signature_request_release_hold**](docs/SignatureRequestApi.md#signature_request_release_hold) | **POST** /signature_request/release_hold/{signature_request_id} | Release On-Hold Signature Request |
|*HelloSign::SignatureRequestApi* | [**signature_request_remind**](docs/SignatureRequestApi.md#signature_request_remind) | **POST** /signature_request/remind/{signature_request_id} | Send Request Reminder |
|*HelloSign::SignatureRequestApi* | [**signature_request_remove**](docs/SignatureRequestApi.md#signature_request_remove) | **POST** /signature_request/remove/{signature_request_id} | Remove Signature Request Access |
|*HelloSign::SignatureRequestApi* | [**signature_request_send**](docs/SignatureRequestApi.md#signature_request_send) | **POST** /signature_request/send | Send Signature Request |
|*HelloSign::SignatureRequestApi* | [**signature_request_send_with_template**](docs/SignatureRequestApi.md#signature_request_send_with_template) | **POST** /signature_request/send_with_template | Send with Template |
|*HelloSign::SignatureRequestApi* | [**signature_request_update**](docs/SignatureRequestApi.md#signature_request_update) | **POST** /signature_request/update/{signature_request_id} | Update Signature Request |
|*HelloSign::TeamApi* | [**team_add_member**](docs/TeamApi.md#team_add_member) | **PUT** /team/add_member | Add User to Team |
|*HelloSign::TeamApi* | [**team_create**](docs/TeamApi.md#team_create) | **POST** /team/create | Create Team |
|*HelloSign::TeamApi* | [**team_delete**](docs/TeamApi.md#team_delete) | **DELETE** /team/destroy | Delete Team |
|*HelloSign::TeamApi* | [**team_get**](docs/TeamApi.md#team_get) | **GET** /team | Get Team |
|*HelloSign::TeamApi* | [**team_info**](docs/TeamApi.md#team_info) | **GET** /team/info | Get Team Info |
|*HelloSign::TeamApi* | [**team_invites**](docs/TeamApi.md#team_invites) | **GET** /team/invites | List Team Invites |
|*HelloSign::TeamApi* | [**team_members**](docs/TeamApi.md#team_members) | **GET** /team/members/{team_id} | List Team Members |
|*HelloSign::TeamApi* | [**team_remove_member**](docs/TeamApi.md#team_remove_member) | **POST** /team/remove_member | Remove User from Team |
|*HelloSign::TeamApi* | [**team_sub_teams**](docs/TeamApi.md#team_sub_teams) | **GET** /team/sub_teams/{team_id} | List Sub Teams |
|*HelloSign::TeamApi* | [**team_update**](docs/TeamApi.md#team_update) | **PUT** /team | Update Team |
|*HelloSign::TemplateApi* | [**template_add_user**](docs/TemplateApi.md#template_add_user) | **POST** /template/add_user/{template_id} | Add User to Template |
|*HelloSign::TemplateApi* | [**template_create_embedded_draft**](docs/TemplateApi.md#template_create_embedded_draft) | **POST** /template/create_embedded_draft | Create Embedded Template Draft |
|*HelloSign::TemplateApi* | [**template_delete**](docs/TemplateApi.md#template_delete) | **POST** /template/delete/{template_id} | Delete Template |
|*HelloSign::TemplateApi* | [**template_files**](docs/TemplateApi.md#template_files) | **GET** /template/files/{template_id} | Get Template Files |
|*HelloSign::TemplateApi* | [**template_files_as_data_uri**](docs/TemplateApi.md#template_files_as_data_uri) | **GET** /template/files_as_data_uri/{template_id} | Get Template Files as Data Uri |
|*HelloSign::TemplateApi* | [**template_files_as_file_url**](docs/TemplateApi.md#template_files_as_file_url) | **GET** /template/files_as_file_url/{template_id} | Get Template Files as File Url |
|*HelloSign::TemplateApi* | [**template_get**](docs/TemplateApi.md#template_get) | **GET** /template/{template_id} | Get Template |
|*HelloSign::TemplateApi* | [**template_list**](docs/TemplateApi.md#template_list) | **GET** /template/list | List Templates |
|*HelloSign::TemplateApi* | [**template_remove_user**](docs/TemplateApi.md#template_remove_user) | **POST** /template/remove_user/{template_id} | Remove User from Template |
|*HelloSign::TemplateApi* | [**template_update_files**](docs/TemplateApi.md#template_update_files) | **POST** /template/update_files/{template_id} | Update Template Files |
|*HelloSign::UnclaimedDraftApi* | [**unclaimed_draft_create**](docs/UnclaimedDraftApi.md#unclaimed_draft_create) | **POST** /unclaimed_draft/create | Create Unclaimed Draft |
|*HelloSign::UnclaimedDraftApi* | [**unclaimed_draft_create_embedded**](docs/UnclaimedDraftApi.md#unclaimed_draft_create_embedded) | **POST** /unclaimed_draft/create_embedded | Create Embedded Unclaimed Draft |
|*HelloSign::UnclaimedDraftApi* | [**unclaimed_draft_create_embedded_with_template**](docs/UnclaimedDraftApi.md#unclaimed_draft_create_embedded_with_template) | **POST** /unclaimed_draft/create_embedded_with_template | Create Embedded Unclaimed Draft with Template |
|*HelloSign::UnclaimedDraftApi* | [**unclaimed_draft_edit_and_resend**](docs/UnclaimedDraftApi.md#unclaimed_draft_edit_and_resend) | **POST** /unclaimed_draft/edit_and_resend/{signature_request_id} | Edit and Resend Unclaimed Draft |


## Documentation for Models

 - [HelloSign::AccountCreateRequest](docs/AccountCreateRequest.md)
 - [HelloSign::AccountCreateResponse](docs/AccountCreateResponse.md)
 - [HelloSign::AccountGetResponse](docs/AccountGetResponse.md)
 - [HelloSign::AccountResponse](docs/AccountResponse.md)
 - [HelloSign::AccountResponseQuotas](docs/AccountResponseQuotas.md)
 - [HelloSign::AccountUpdateRequest](docs/AccountUpdateRequest.md)
 - [HelloSign::AccountVerifyRequest](docs/AccountVerifyRequest.md)
 - [HelloSign::AccountVerifyResponse](docs/AccountVerifyResponse.md)
 - [HelloSign::AccountVerifyResponseAccount](docs/AccountVerifyResponseAccount.md)
 - [HelloSign::ApiAppCreateRequest](docs/ApiAppCreateRequest.md)
 - [HelloSign::ApiAppGetResponse](docs/ApiAppGetResponse.md)
 - [HelloSign::ApiAppListResponse](docs/ApiAppListResponse.md)
 - [HelloSign::ApiAppResponse](docs/ApiAppResponse.md)
 - [HelloSign::ApiAppResponseOAuth](docs/ApiAppResponseOAuth.md)
 - [HelloSign::ApiAppResponseOptions](docs/ApiAppResponseOptions.md)
 - [HelloSign::ApiAppResponseOwnerAccount](docs/ApiAppResponseOwnerAccount.md)
 - [HelloSign::ApiAppResponseWhiteLabelingOptions](docs/ApiAppResponseWhiteLabelingOptions.md)
 - [HelloSign::ApiAppUpdateRequest](docs/ApiAppUpdateRequest.md)
 - [HelloSign::BulkSendJobGetResponse](docs/BulkSendJobGetResponse.md)
 - [HelloSign::BulkSendJobGetResponseSignatureRequests](docs/BulkSendJobGetResponseSignatureRequests.md)
 - [HelloSign::BulkSendJobListResponse](docs/BulkSendJobListResponse.md)
 - [HelloSign::BulkSendJobResponse](docs/BulkSendJobResponse.md)
 - [HelloSign::BulkSendJobSendResponse](docs/BulkSendJobSendResponse.md)
 - [HelloSign::EmbeddedEditUrlRequest](docs/EmbeddedEditUrlRequest.md)
 - [HelloSign::EmbeddedEditUrlResponse](docs/EmbeddedEditUrlResponse.md)
 - [HelloSign::EmbeddedEditUrlResponseEmbedded](docs/EmbeddedEditUrlResponseEmbedded.md)
 - [HelloSign::EmbeddedSignUrlResponse](docs/EmbeddedSignUrlResponse.md)
 - [HelloSign::EmbeddedSignUrlResponseEmbedded](docs/EmbeddedSignUrlResponseEmbedded.md)
 - [HelloSign::ErrorResponse](docs/ErrorResponse.md)
 - [HelloSign::ErrorResponseError](docs/ErrorResponseError.md)
 - [HelloSign::EventCallbackAccountRequest](docs/EventCallbackAccountRequest.md)
 - [HelloSign::EventCallbackAccountRequestPayload](docs/EventCallbackAccountRequestPayload.md)
 - [HelloSign::EventCallbackApiAppRequest](docs/EventCallbackApiAppRequest.md)
 - [HelloSign::EventCallbackApiAppRequestPayload](docs/EventCallbackApiAppRequestPayload.md)
 - [HelloSign::EventCallbackRequestEvent](docs/EventCallbackRequestEvent.md)
 - [HelloSign::EventCallbackRequestEventMetadata](docs/EventCallbackRequestEventMetadata.md)
 - [HelloSign::FileResponse](docs/FileResponse.md)
 - [HelloSign::FileResponseDataUri](docs/FileResponseDataUri.md)
 - [HelloSign::ListInfoResponse](docs/ListInfoResponse.md)
 - [HelloSign::OAuthTokenGenerateRequest](docs/OAuthTokenGenerateRequest.md)
 - [HelloSign::OAuthTokenRefreshRequest](docs/OAuthTokenRefreshRequest.md)
 - [HelloSign::OAuthTokenResponse](docs/OAuthTokenResponse.md)
 - [HelloSign::ReportCreateRequest](docs/ReportCreateRequest.md)
 - [HelloSign::ReportCreateResponse](docs/ReportCreateResponse.md)
 - [HelloSign::ReportResponse](docs/ReportResponse.md)
 - [HelloSign::SignatureRequestBulkCreateEmbeddedWithTemplateRequest](docs/SignatureRequestBulkCreateEmbeddedWithTemplateRequest.md)
 - [HelloSign::SignatureRequestBulkSendWithTemplateRequest](docs/SignatureRequestBulkSendWithTemplateRequest.md)
 - [HelloSign::SignatureRequestCreateEmbeddedRequest](docs/SignatureRequestCreateEmbeddedRequest.md)
 - [HelloSign::SignatureRequestCreateEmbeddedWithTemplateRequest](docs/SignatureRequestCreateEmbeddedWithTemplateRequest.md)
 - [HelloSign::SignatureRequestGetResponse](docs/SignatureRequestGetResponse.md)
 - [HelloSign::SignatureRequestListResponse](docs/SignatureRequestListResponse.md)
 - [HelloSign::SignatureRequestRemindRequest](docs/SignatureRequestRemindRequest.md)
 - [HelloSign::SignatureRequestResponse](docs/SignatureRequestResponse.md)
 - [HelloSign::SignatureRequestResponseAttachment](docs/SignatureRequestResponseAttachment.md)
 - [HelloSign::SignatureRequestResponseCustomFieldBase](docs/SignatureRequestResponseCustomFieldBase.md)
 - [HelloSign::SignatureRequestResponseCustomFieldCheckbox](docs/SignatureRequestResponseCustomFieldCheckbox.md)
 - [HelloSign::SignatureRequestResponseCustomFieldText](docs/SignatureRequestResponseCustomFieldText.md)
 - [HelloSign::SignatureRequestResponseCustomFieldTypeEnum](docs/SignatureRequestResponseCustomFieldTypeEnum.md)
 - [HelloSign::SignatureRequestResponseDataBase](docs/SignatureRequestResponseDataBase.md)
 - [HelloSign::SignatureRequestResponseDataTypeEnum](docs/SignatureRequestResponseDataTypeEnum.md)
 - [HelloSign::SignatureRequestResponseDataValueCheckbox](docs/SignatureRequestResponseDataValueCheckbox.md)
 - [HelloSign::SignatureRequestResponseDataValueCheckboxMerge](docs/SignatureRequestResponseDataValueCheckboxMerge.md)
 - [HelloSign::SignatureRequestResponseDataValueDateSigned](docs/SignatureRequestResponseDataValueDateSigned.md)
 - [HelloSign::SignatureRequestResponseDataValueDropdown](docs/SignatureRequestResponseDataValueDropdown.md)
 - [HelloSign::SignatureRequestResponseDataValueInitials](docs/SignatureRequestResponseDataValueInitials.md)
 - [HelloSign::SignatureRequestResponseDataValueRadio](docs/SignatureRequestResponseDataValueRadio.md)
 - [HelloSign::SignatureRequestResponseDataValueSignature](docs/SignatureRequestResponseDataValueSignature.md)
 - [HelloSign::SignatureRequestResponseDataValueText](docs/SignatureRequestResponseDataValueText.md)
 - [HelloSign::SignatureRequestResponseDataValueTextMerge](docs/SignatureRequestResponseDataValueTextMerge.md)
 - [HelloSign::SignatureRequestResponseSignatures](docs/SignatureRequestResponseSignatures.md)
 - [HelloSign::SignatureRequestSendRequest](docs/SignatureRequestSendRequest.md)
 - [HelloSign::SignatureRequestSendWithTemplateRequest](docs/SignatureRequestSendWithTemplateRequest.md)
 - [HelloSign::SignatureRequestUpdateRequest](docs/SignatureRequestUpdateRequest.md)
 - [HelloSign::SubAttachment](docs/SubAttachment.md)
 - [HelloSign::SubBulkSignerList](docs/SubBulkSignerList.md)
 - [HelloSign::SubBulkSignerListCustomField](docs/SubBulkSignerListCustomField.md)
 - [HelloSign::SubCC](docs/SubCC.md)
 - [HelloSign::SubCustomField](docs/SubCustomField.md)
 - [HelloSign::SubEditorOptions](docs/SubEditorOptions.md)
 - [HelloSign::SubFieldOptions](docs/SubFieldOptions.md)
 - [HelloSign::SubFormFieldGroup](docs/SubFormFieldGroup.md)
 - [HelloSign::SubFormFieldRule](docs/SubFormFieldRule.md)
 - [HelloSign::SubFormFieldRuleAction](docs/SubFormFieldRuleAction.md)
 - [HelloSign::SubFormFieldRuleTrigger](docs/SubFormFieldRuleTrigger.md)
 - [HelloSign::SubFormFieldsPerDocumentBase](docs/SubFormFieldsPerDocumentBase.md)
 - [HelloSign::SubFormFieldsPerDocumentCheckbox](docs/SubFormFieldsPerDocumentCheckbox.md)
 - [HelloSign::SubFormFieldsPerDocumentCheckboxMerge](docs/SubFormFieldsPerDocumentCheckboxMerge.md)
 - [HelloSign::SubFormFieldsPerDocumentDateSigned](docs/SubFormFieldsPerDocumentDateSigned.md)
 - [HelloSign::SubFormFieldsPerDocumentDropdown](docs/SubFormFieldsPerDocumentDropdown.md)
 - [HelloSign::SubFormFieldsPerDocumentHyperlink](docs/SubFormFieldsPerDocumentHyperlink.md)
 - [HelloSign::SubFormFieldsPerDocumentInitials](docs/SubFormFieldsPerDocumentInitials.md)
 - [HelloSign::SubFormFieldsPerDocumentRadio](docs/SubFormFieldsPerDocumentRadio.md)
 - [HelloSign::SubFormFieldsPerDocumentSignature](docs/SubFormFieldsPerDocumentSignature.md)
 - [HelloSign::SubFormFieldsPerDocumentText](docs/SubFormFieldsPerDocumentText.md)
 - [HelloSign::SubFormFieldsPerDocumentTextMerge](docs/SubFormFieldsPerDocumentTextMerge.md)
 - [HelloSign::SubFormFieldsPerDocumentTypeEnum](docs/SubFormFieldsPerDocumentTypeEnum.md)
 - [HelloSign::SubMergeField](docs/SubMergeField.md)
 - [HelloSign::SubOAuth](docs/SubOAuth.md)
 - [HelloSign::SubOptions](docs/SubOptions.md)
 - [HelloSign::SubSignatureRequestSigner](docs/SubSignatureRequestSigner.md)
 - [HelloSign::SubSignatureRequestTemplateSigner](docs/SubSignatureRequestTemplateSigner.md)
 - [HelloSign::SubSigningOptions](docs/SubSigningOptions.md)
 - [HelloSign::SubTeamResponse](docs/SubTeamResponse.md)
 - [HelloSign::SubTemplateRole](docs/SubTemplateRole.md)
 - [HelloSign::SubUnclaimedDraftSigner](docs/SubUnclaimedDraftSigner.md)
 - [HelloSign::SubUnclaimedDraftTemplateSigner](docs/SubUnclaimedDraftTemplateSigner.md)
 - [HelloSign::SubWhiteLabelingOptions](docs/SubWhiteLabelingOptions.md)
 - [HelloSign::TeamAddMemberRequest](docs/TeamAddMemberRequest.md)
 - [HelloSign::TeamCreateRequest](docs/TeamCreateRequest.md)
 - [HelloSign::TeamGetInfoResponse](docs/TeamGetInfoResponse.md)
 - [HelloSign::TeamGetResponse](docs/TeamGetResponse.md)
 - [HelloSign::TeamInfoResponse](docs/TeamInfoResponse.md)
 - [HelloSign::TeamInviteResponse](docs/TeamInviteResponse.md)
 - [HelloSign::TeamInvitesResponse](docs/TeamInvitesResponse.md)
 - [HelloSign::TeamMemberResponse](docs/TeamMemberResponse.md)
 - [HelloSign::TeamMembersResponse](docs/TeamMembersResponse.md)
 - [HelloSign::TeamParentResponse](docs/TeamParentResponse.md)
 - [HelloSign::TeamRemoveMemberRequest](docs/TeamRemoveMemberRequest.md)
 - [HelloSign::TeamResponse](docs/TeamResponse.md)
 - [HelloSign::TeamSubTeamsResponse](docs/TeamSubTeamsResponse.md)
 - [HelloSign::TeamUpdateRequest](docs/TeamUpdateRequest.md)
 - [HelloSign::TemplateAddUserRequest](docs/TemplateAddUserRequest.md)
 - [HelloSign::TemplateCreateEmbeddedDraftRequest](docs/TemplateCreateEmbeddedDraftRequest.md)
 - [HelloSign::TemplateCreateEmbeddedDraftResponse](docs/TemplateCreateEmbeddedDraftResponse.md)
 - [HelloSign::TemplateCreateEmbeddedDraftResponseTemplate](docs/TemplateCreateEmbeddedDraftResponseTemplate.md)
 - [HelloSign::TemplateEditResponse](docs/TemplateEditResponse.md)
 - [HelloSign::TemplateGetResponse](docs/TemplateGetResponse.md)
 - [HelloSign::TemplateListResponse](docs/TemplateListResponse.md)
 - [HelloSign::TemplateRemoveUserRequest](docs/TemplateRemoveUserRequest.md)
 - [HelloSign::TemplateResponse](docs/TemplateResponse.md)
 - [HelloSign::TemplateResponseAccount](docs/TemplateResponseAccount.md)
 - [HelloSign::TemplateResponseAccountQuota](docs/TemplateResponseAccountQuota.md)
 - [HelloSign::TemplateResponseCCRole](docs/TemplateResponseCCRole.md)
 - [HelloSign::TemplateResponseCustomField](docs/TemplateResponseCustomField.md)
 - [HelloSign::TemplateResponseDocument](docs/TemplateResponseDocument.md)
 - [HelloSign::TemplateResponseDocumentCustomField](docs/TemplateResponseDocumentCustomField.md)
 - [HelloSign::TemplateResponseDocumentFieldGroup](docs/TemplateResponseDocumentFieldGroup.md)
 - [HelloSign::TemplateResponseDocumentFormField](docs/TemplateResponseDocumentFormField.md)
 - [HelloSign::TemplateResponseDocumentStaticField](docs/TemplateResponseDocumentStaticField.md)
 - [HelloSign::TemplateResponseFieldAvgTextLength](docs/TemplateResponseFieldAvgTextLength.md)
 - [HelloSign::TemplateResponseNamedFormField](docs/TemplateResponseNamedFormField.md)
 - [HelloSign::TemplateResponseSignerRole](docs/TemplateResponseSignerRole.md)
 - [HelloSign::TemplateUpdateFilesRequest](docs/TemplateUpdateFilesRequest.md)
 - [HelloSign::TemplateUpdateFilesResponse](docs/TemplateUpdateFilesResponse.md)
 - [HelloSign::TemplateUpdateFilesResponseTemplate](docs/TemplateUpdateFilesResponseTemplate.md)
 - [HelloSign::UnclaimedDraftCreateEmbeddedRequest](docs/UnclaimedDraftCreateEmbeddedRequest.md)
 - [HelloSign::UnclaimedDraftCreateEmbeddedWithTemplateRequest](docs/UnclaimedDraftCreateEmbeddedWithTemplateRequest.md)
 - [HelloSign::UnclaimedDraftCreateRequest](docs/UnclaimedDraftCreateRequest.md)
 - [HelloSign::UnclaimedDraftCreateResponse](docs/UnclaimedDraftCreateResponse.md)
 - [HelloSign::UnclaimedDraftEditAndResendRequest](docs/UnclaimedDraftEditAndResendRequest.md)
 - [HelloSign::UnclaimedDraftResponse](docs/UnclaimedDraftResponse.md)
 - [HelloSign::WarningResponse](docs/WarningResponse.md)


## Documentation for Authorization


### api_key

- **Type**: HTTP basic authentication

### oauth2

- **Type**: Bearer authentication (JWT)

