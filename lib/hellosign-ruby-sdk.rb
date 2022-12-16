=begin
#Dropbox Sign API

#Dropbox Sign v3 API

The version of the OpenAPI document: 3.0.0
Contact: apisupport@hellosign.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

# Common files
require 'hellosign-ruby-sdk/api_client'
require 'hellosign-ruby-sdk/api_error'
require 'hellosign-ruby-sdk/version'
require 'hellosign-ruby-sdk/configuration'

# Models
require 'hellosign-ruby-sdk/models/account_create_request'
require 'hellosign-ruby-sdk/models/account_create_response'
require 'hellosign-ruby-sdk/models/account_get_response'
require 'hellosign-ruby-sdk/models/account_response'
require 'hellosign-ruby-sdk/models/account_response_quotas'
require 'hellosign-ruby-sdk/models/account_update_request'
require 'hellosign-ruby-sdk/models/account_verify_request'
require 'hellosign-ruby-sdk/models/account_verify_response'
require 'hellosign-ruby-sdk/models/account_verify_response_account'
require 'hellosign-ruby-sdk/models/api_app_create_request'
require 'hellosign-ruby-sdk/models/api_app_get_response'
require 'hellosign-ruby-sdk/models/api_app_list_response'
require 'hellosign-ruby-sdk/models/api_app_response'
require 'hellosign-ruby-sdk/models/api_app_response_o_auth'
require 'hellosign-ruby-sdk/models/api_app_response_options'
require 'hellosign-ruby-sdk/models/api_app_response_owner_account'
require 'hellosign-ruby-sdk/models/api_app_response_white_labeling_options'
require 'hellosign-ruby-sdk/models/api_app_update_request'
require 'hellosign-ruby-sdk/models/bulk_send_job_get_response'
require 'hellosign-ruby-sdk/models/bulk_send_job_get_response_signature_requests'
require 'hellosign-ruby-sdk/models/bulk_send_job_list_response'
require 'hellosign-ruby-sdk/models/bulk_send_job_response'
require 'hellosign-ruby-sdk/models/bulk_send_job_send_response'
require 'hellosign-ruby-sdk/models/embedded_edit_url_request'
require 'hellosign-ruby-sdk/models/embedded_edit_url_response'
require 'hellosign-ruby-sdk/models/embedded_edit_url_response_embedded'
require 'hellosign-ruby-sdk/models/embedded_sign_url_response'
require 'hellosign-ruby-sdk/models/embedded_sign_url_response_embedded'
require 'hellosign-ruby-sdk/models/error_response'
require 'hellosign-ruby-sdk/models/error_response_error'
require 'hellosign-ruby-sdk/models/event_callback_request'
require 'hellosign-ruby-sdk/models/event_callback_request_event'
require 'hellosign-ruby-sdk/models/event_callback_request_event_metadata'
require 'hellosign-ruby-sdk/models/file_response'
require 'hellosign-ruby-sdk/models/file_response_data_uri'
require 'hellosign-ruby-sdk/models/list_info_response'
require 'hellosign-ruby-sdk/models/o_auth_token_generate_request'
require 'hellosign-ruby-sdk/models/o_auth_token_refresh_request'
require 'hellosign-ruby-sdk/models/o_auth_token_response'
require 'hellosign-ruby-sdk/models/report_create_request'
require 'hellosign-ruby-sdk/models/report_create_response'
require 'hellosign-ruby-sdk/models/report_response'
require 'hellosign-ruby-sdk/models/signature_request_bulk_create_embedded_with_template_request'
require 'hellosign-ruby-sdk/models/signature_request_bulk_send_with_template_request'
require 'hellosign-ruby-sdk/models/signature_request_create_embedded_request'
require 'hellosign-ruby-sdk/models/signature_request_create_embedded_with_template_request'
require 'hellosign-ruby-sdk/models/signature_request_get_response'
require 'hellosign-ruby-sdk/models/signature_request_list_response'
require 'hellosign-ruby-sdk/models/signature_request_remind_request'
require 'hellosign-ruby-sdk/models/signature_request_response'
require 'hellosign-ruby-sdk/models/signature_request_response_attachment'
require 'hellosign-ruby-sdk/models/signature_request_response_custom_field_base'
require 'hellosign-ruby-sdk/models/signature_request_response_custom_field_type_enum'
require 'hellosign-ruby-sdk/models/signature_request_response_data_base'
require 'hellosign-ruby-sdk/models/signature_request_response_data_type_enum'
require 'hellosign-ruby-sdk/models/signature_request_response_signatures'
require 'hellosign-ruby-sdk/models/signature_request_send_request'
require 'hellosign-ruby-sdk/models/signature_request_send_with_template_request'
require 'hellosign-ruby-sdk/models/signature_request_update_request'
require 'hellosign-ruby-sdk/models/sub_attachment'
require 'hellosign-ruby-sdk/models/sub_bulk_signer_list'
require 'hellosign-ruby-sdk/models/sub_bulk_signer_list_custom_field'
require 'hellosign-ruby-sdk/models/sub_cc'
require 'hellosign-ruby-sdk/models/sub_custom_field'
require 'hellosign-ruby-sdk/models/sub_editor_options'
require 'hellosign-ruby-sdk/models/sub_field_options'
require 'hellosign-ruby-sdk/models/sub_form_field_group'
require 'hellosign-ruby-sdk/models/sub_form_field_rule'
require 'hellosign-ruby-sdk/models/sub_form_field_rule_action'
require 'hellosign-ruby-sdk/models/sub_form_field_rule_trigger'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_base'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_type_enum'
require 'hellosign-ruby-sdk/models/sub_merge_field'
require 'hellosign-ruby-sdk/models/sub_o_auth'
require 'hellosign-ruby-sdk/models/sub_options'
require 'hellosign-ruby-sdk/models/sub_signature_request_signer'
require 'hellosign-ruby-sdk/models/sub_signature_request_template_signer'
require 'hellosign-ruby-sdk/models/sub_signing_options'
require 'hellosign-ruby-sdk/models/sub_team_response'
require 'hellosign-ruby-sdk/models/sub_template_role'
require 'hellosign-ruby-sdk/models/sub_unclaimed_draft_signer'
require 'hellosign-ruby-sdk/models/sub_unclaimed_draft_template_signer'
require 'hellosign-ruby-sdk/models/sub_white_labeling_options'
require 'hellosign-ruby-sdk/models/team_add_member_request'
require 'hellosign-ruby-sdk/models/team_create_request'
require 'hellosign-ruby-sdk/models/team_get_info_response'
require 'hellosign-ruby-sdk/models/team_get_response'
require 'hellosign-ruby-sdk/models/team_info_response'
require 'hellosign-ruby-sdk/models/team_invite_response'
require 'hellosign-ruby-sdk/models/team_invites_response'
require 'hellosign-ruby-sdk/models/team_member_response'
require 'hellosign-ruby-sdk/models/team_members_response'
require 'hellosign-ruby-sdk/models/team_parent_response'
require 'hellosign-ruby-sdk/models/team_remove_member_request'
require 'hellosign-ruby-sdk/models/team_response'
require 'hellosign-ruby-sdk/models/team_sub_teams_response'
require 'hellosign-ruby-sdk/models/team_update_request'
require 'hellosign-ruby-sdk/models/template_add_user_request'
require 'hellosign-ruby-sdk/models/template_create_embedded_draft_request'
require 'hellosign-ruby-sdk/models/template_create_embedded_draft_response'
require 'hellosign-ruby-sdk/models/template_create_embedded_draft_response_template'
require 'hellosign-ruby-sdk/models/template_edit_response'
require 'hellosign-ruby-sdk/models/template_get_response'
require 'hellosign-ruby-sdk/models/template_list_response'
require 'hellosign-ruby-sdk/models/template_remove_user_request'
require 'hellosign-ruby-sdk/models/template_response'
require 'hellosign-ruby-sdk/models/template_response_account'
require 'hellosign-ruby-sdk/models/template_response_account_quota'
require 'hellosign-ruby-sdk/models/template_response_cc_role'
require 'hellosign-ruby-sdk/models/template_response_custom_field'
require 'hellosign-ruby-sdk/models/template_response_document'
require 'hellosign-ruby-sdk/models/template_response_document_custom_field'
require 'hellosign-ruby-sdk/models/template_response_document_field_group'
require 'hellosign-ruby-sdk/models/template_response_document_form_field'
require 'hellosign-ruby-sdk/models/template_response_document_static_field'
require 'hellosign-ruby-sdk/models/template_response_field_avg_text_length'
require 'hellosign-ruby-sdk/models/template_response_named_form_field'
require 'hellosign-ruby-sdk/models/template_response_signer_role'
require 'hellosign-ruby-sdk/models/template_update_files_request'
require 'hellosign-ruby-sdk/models/template_update_files_response'
require 'hellosign-ruby-sdk/models/template_update_files_response_template'
require 'hellosign-ruby-sdk/models/unclaimed_draft_create_embedded_request'
require 'hellosign-ruby-sdk/models/unclaimed_draft_create_embedded_with_template_request'
require 'hellosign-ruby-sdk/models/unclaimed_draft_create_request'
require 'hellosign-ruby-sdk/models/unclaimed_draft_create_response'
require 'hellosign-ruby-sdk/models/unclaimed_draft_edit_and_resend_request'
require 'hellosign-ruby-sdk/models/unclaimed_draft_response'
require 'hellosign-ruby-sdk/models/warning_response'
require 'hellosign-ruby-sdk/models/signature_request_response_custom_field_checkbox'
require 'hellosign-ruby-sdk/models/signature_request_response_custom_field_text'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_checkbox'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_checkbox_merge'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_date_signed'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_dropdown'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_initials'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_radio'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_signature'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_text'
require 'hellosign-ruby-sdk/models/signature_request_response_data_value_text_merge'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_checkbox'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_checkbox_merge'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_date_signed'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_dropdown'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_hyperlink'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_initials'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_radio'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_signature'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_text'
require 'hellosign-ruby-sdk/models/sub_form_fields_per_document_text_merge'

# APIs
require 'hellosign-ruby-sdk/api/account_api'
require 'hellosign-ruby-sdk/api/api_app_api'
require 'hellosign-ruby-sdk/api/bulk_send_job_api'
require 'hellosign-ruby-sdk/api/embedded_api'
require 'hellosign-ruby-sdk/api/o_auth_api'
require 'hellosign-ruby-sdk/api/report_api'
require 'hellosign-ruby-sdk/api/signature_request_api'
require 'hellosign-ruby-sdk/api/team_api'
require 'hellosign-ruby-sdk/api/template_api'
require 'hellosign-ruby-sdk/api/unclaimed_draft_api'

require 'hellosign-ruby-sdk/event_callback_helper'

module HelloSign
  class << self
    # Customize default settings for the SDK using block.
    #   HelloSign.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
