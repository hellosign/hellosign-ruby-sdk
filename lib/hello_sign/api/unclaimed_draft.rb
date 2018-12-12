# The MIT License (MIT)
#
# Copyright (C) 2014 hellosign.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module HelloSign
  module Api
    # Contains all the API calls for the UnclaimedDraft resource.
    # Take a look at our API documentation for creating UnclaimedDrafts (https://app.hellosign.com/api/reference#UnclaimedDraft)
    # for more information about this.
    #
    # @author [hellosign]

    module UnclaimedDraft

      # Creates a new UnclaimedDraft that can be claimed using the claim_url.
      # The first authenticated user to access the claim_url claims the Draft and will be shown either the "Sign and send" or the "Request signature" page with the Draft loaded.
      # Subsequent access to the claim_url will result in a 404 not found error.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [Array<String>] files Specifies the file path(s) to send for the SignatureRequest.
      # @option opts [Array<String>] file_urls Specifies the URL(s) for the file(s) to send for the SignatureRequest.
      # @option opts [String] type The type of UnclaimedDraft to create. Use "send_document" to create a claimable file, and "request_signature" for a claimable SignatureRequest.
      #   * For "send_document," only the file parameter is required.
      #   * For "request_signature," then signer name and email_address are required.
      # @option opts [String] subject The subject in the email that will be sent to the signer(s). (optional)
      # @option opts [String] message The custom message in the email that will be sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers Sets a list of signers, each item is a Hash with these keys:
      #   * name (String) Signer's name
      #   * email_address (String) Signer's email address
      #   * order (Integer) The order the signers are required to sign in (optional)
      # @option opts [Array<Hash>] attachments Sets a list of attachments signers can upload
      #   * name (String) Attachment name
      #   * instructions (String) Instructions for uploading the attachment. (optional)
      #   * signer_index (Integer) The signer's unique number.
      #   * required (Boolean) Determines if the signer is required to upload this attachment. Defaults to 0. (Optional)
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present on the document with Text Tags or form_fields_per_document (optional)
      #   * name (String) Custom field name or "Field Label"
      #   * value (String) The value of the field. This data will appear on the SignatureRequest.
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed on the SignatureRequest. (optional)
      # @option opts [String] signing_redirect_url Redirects the signer(s) to this URL after completing the SignatureRequest. (optional)
      # @option opts [Boolean] use_text_tags Indicates whether the SignatureRequest should have Text Tags enabled. Defaults to 0. (optional)
      # @option opts [Boolean] hide_text_tags Indicates whether the Text Tags should be removed automatically. Note that this is not the preferred method. Defaults to 0. (optional)
      # @option opts [Boolean] use_preexisting_fields Sets the detection of predefined PDF fields. Defaults to 0. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [Boolean] allow_decline Allows signers to decline the SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] allow_reassign Allows signers to reassign the SignatureRequest to another signer. Defaults to 0. (optional)
      # @option opts [Array<Hash>] form_fields_per_document The fields that should appear on the document. (optional)
      # @option opts [Hash] signing_options Specifies the types allowed for creating a signature. (optional)
      #
      # @return [HelloSign::Resource::UnclaimedDraft] an UnclaimedDraft
      #
      # @example type: send_document
      #   unclaimed_draft = @client.create_unclaimed_draft(
      #     test_mode: 1,
      #     files: ['NDA.pdf', 'AppendixA.pdf']
      #   )
      #
      # @example type: request_signature
      #   unclaimed_draft = @client.create_unclaimed_draft(
      #     test_mode: 1,
      #     type: 'request_signature',
      #     subject: 'The NDA we talked about',
      #     message: 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     metadata: {
      #       client_id: '1234',
      #       custom_text: 'NDA #9'
      #     },
      #     signers: [
      #       {
      #         email_address: 'jack@example.com',
      #         name: 'Jack',
      #         order: 0
      #       },
      #       {
      #         email_address: 'jill@example.com',
      #         name: 'Jill',
      #         order: 1
      #       }
      #     ],
      #     attachments: [{
      #       name: 'Passport',
      #       instructions: 'Upload your US Passport',
      #       signer_index: 0,
      #       required: true
      #       },
      #       {
      #       name: 'Driver's License',
      #       instructions: 'Upload your CA Driver's License',
      #       signer_index: 1,
      #       required: false
      #       }
      #     ],
      #     cc_email_addresses: ['lawyer@example.com', 'lawyer@example2.com'],
      #     files: ['NDA.pdf', 'AppendixA.pdf'],
      #     signing_options: {
      #       draw: true,
      #       type: true,
      #       upload: false,
      #       phone: true,
      #       default: 'phone'
      #     }
      #   )
      #
      def create_unclaimed_draft opts
        prepare_files opts
        prepare_signers opts
        prepare_form_fields opts
        prepare_custom_fields opts
        prepare_attachments opts

        HelloSign::Resource::UnclaimedDraft.new post('/unclaimed_draft/create', body: opts)
      end

      # Creates a new Embedded UnclaimedDraft that can be opened in an embedded iFrame.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [String] client_id The API App Client ID associated with this Embedded UnclaimedDraft.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] requester_email_address The email address of the requester, if "request_signature" type.
      # @option opts [String] type The type of UnclaimedDraft to create. Use "send_document" to create a claimable file, and "request_signature" for a claimable signature request.
      #   * For "send_document," only the file parameter is required.
      #   * For "request_signature," then signer name and email_address are required.
      # @option opts [String] subject Sets the subject in the email sent to the signer(s). (optional)
      # @option opts [String] message Sets the message in the email sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers Sets a list of signers, each item is a Hash with these keys:
      #   * name (String) Signer's name
      #   * email_address (String) Signer's email address
      #   * order (Integer) The order the signers are required to sign in (optional)
      # @option opts [Array<Hash>] attachments Sets a list of attachments signers can upload
      #   * name (String) Attachment name
      #   * instructions (String) Instructions for uploading the attachment. (optional)
      #   * signer_index (Integer) The signer's unique number.
      #   * required (Boolean) Determines if the signer is required to upload this attachment. Defaults to 0. (Optional)
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed on the SignatureRequest. (optional)
      # @option opts [String] signing_redirect_url Redirects the signer(s) to this URL after completing the SignatureRequest. (optional)
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present on the document with Text Tags or form_fields_per_document (optional)
      #   * name (String) Custom field name or "Field Label"
      #   * value (String) The value of the field. This data will appear on the SignatureRequest.
      # @option opts [Boolean] use_text_tags Indicates whether the SignatureRequest should have Text Tags enabled. Defaults to 0. (optional)
      # @option opts [Boolean] hide_text_tags Indicates whether the Text Tags should be removed automatically. Note that this is not the preferred method. Defaults to 0. (optional)
      # @option opts [Boolean] use_preexisting_fields Sets the detection of predefined PDF fields. Defaults to 0. (optional)
      # @option opts [Boolean] is_for_embedded_signing Enable the UnclaimedDraft to be used for an Embedded SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] skip_me_now Disables the "Me (Now)" option for the preparer. Not available for type "send_document." Defaults to 0. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [Boolean] allow_decline Allows signers to decline the SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] allow_reassign Allows signers to reassign the SignatureRequest to another signer. Defaults to 0. (optional)
      # @option opts [Array<Hash>] form_fields_per_document The fields that should appear on the document. (optional)
      # @option opts [Hash] signing_options Specifies the types allowed for creating a signature. (optional)
      #
      # @return [HelloSign::Resource::UnclaimedDraft] an UnclaimedDraft
      #
      # @example type: request_signature
      #   unclaimed_draft = @client.create_embedded_unclaimed_draft(
      #     test_mode: 1,
      #     type: 'request_signature',
      #     subject: 'The NDA we talked about',
      #     requester_email_address: 'requester@example.com',
      #     message: 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     metadata: {
      #       client_id: '1234',
      #       custom_text: 'NDA #9'
      #     },
      #     signers: [
      #       {
      #         email_address: 'jack@example.com',
      #         name: 'Jack',
      #         order: 0
      #       },
      #       {
      #         email_address: 'jill@example.com',
      #         name: 'Jill',
      #         order: 1
      #       }
      #     ],
      #     attachments: [{
      #       name: 'Passport',
      #       instructions: 'Upload your US Passport',
      #       signer_index: 0,
      #       required: true
      #       },
      #       {
      #       name: 'Driver's License',
      #       instructions: 'Upload your CA Driver's License',
      #       signer_index: 1,
      #       required: false
      #       }
      #     ],
      #     cc_email_addresses: ['lawyer@example.com', 'lawyer@example2.com'],
      #     files: ['NDA.pdf', 'AppendixA.pdf'],
      #     signing_options: {
      #       draw: true,
      #       type: true,
      #       upload: false,
      #       phone: true,
      #       default: 'phone'
      #     }
      #   )
      def create_embedded_unclaimed_draft(opts)
        opts[:client_id] ||= self.client_id
        prepare_files opts
        prepare_signers opts
        prepare_form_fields opts
        prepare_custom_fields opts
        prepare_attachments opts

        HelloSign::Resource::UnclaimedDraft.new post('/unclaimed_draft/create_embedded', body: opts)
      end

      # Creates a new Embedded UnclaimedDraft from a Template that can be opened in an embedded iFrame.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [String] client_id The API App Client ID associated with the UnclaimedDraft.
      # @option opts [String] template_id The Template ID to use when creating the UnclaimedDraft.
      #   * Use template_ids[%i%] if using multiple templates, replacing %i% with an integer to indicate the order of the Templates
      # @option opts [String] requester_email_address The email address of the requester, if "request_signature" type.
      # @option opts [String] title Assigns a title to the SignatureRequest. (optional)
      # @option opts [String] subject Sets the subject in the email sent to the signer(s). (optional)
      # @option opts [String] message Sets the message in the email sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers List of signers
      #   * role (String) The signer role indicated on the Template.
      #   * name (String) Signer's name
      #   * email_address (String) Signer's email address
      # @option opts [Array<Hash>] ccs The individual(s) to be CC'd on the SignatureRequest. Required when a CC role exists for the Template.
      #   * role (String) The CC role indicated on the Template. Note that the role name is case sensitive.
      #   * email_address (String) CC Recipient's email address
      # @option opts [String] signing_redirect_url Redirects the signer(s) to this URL after completing the SignatureRequest. (optional)
      # @option opts [String] requesting_redirect_url Redirects the requester to this URL after sending a SignatureRequest. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present in the Template. (optional)
      #   * name (String) Custom field name or "Field Label"
      #   * value (String) The value of the field. This data will appear on the SignatureRequest.
      # @option opts [Array<String>] files Specifies the file path(s) to append to the SignatureRequest. (optional)
      # @option opts [Array<String>] file_urls Specifies the URL(s) for the file(s) to append to the SignatureRequest. (optional)
      # @option opts [Boolean] skip_me_now Disables the "Me (Now)" option for the preparer. Not available for type "send_document." Defaults to 0. (optional)
      # @option opts [Boolean] allow_decline Allows signers to decline the SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] allow_reassign Allows signers to reassign the SignatureRequest to another signer. Defaults to 0. (optional)
      # @option opts [Hash] signing_options Specifies the types allowed for creating a signature. (optional)
      #
      # @return [HelloSign::Resource::UnclaimedDraft] an UnclaimedDraft
      #
      # @example type: request_signature
      #   unclaimed_draft = @client.create_embedded_unclaimed_draft_with_template(
      #     test_mode: 1,
      #     subject: 'The NDA we talked about',
      #     template_id: 'c26b8a16784a872da37ea946b9ddec7c1e11dff6',
      #     requester_email_address: 'requester@example.com',
      #     message: 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     files: ['NDA.pdf', 'AppendixA.pdf'],
      #     metadata: {
      #       client_id: '1234',
      #       custom_text: 'NDA #9'
      #     },
      #     signers: [
      #       {
      #         email_address: 'george@example.com',
      #         name: 'George',
      #         role: 'Client'
      #       }
      #     ],
      #     ccs: [
      #       {
      #         email_address:'accounting@example.com',
      #         role: 'Accounting'
      #       }
      #     ],
      #     custom_fields: {
      #       Cost: '$20,000'
      #     },
      #     signing_options: {
      #       draw: true,
      #       type: true,
      #       upload: false,
      #       phone: true,
      #       default: 'phone'
      #    }
      #   )
      def create_embedded_unclaimed_draft_with_template(opts)
        opts[:client_id] ||= self.client_id
        prepare_signers opts
        prepare_custom_fields opts
        prepare_ccs opts
        prepare_templates opts
        prepare_files opts

        HelloSign::Resource::UnclaimedDraft.new post('/unclaimed_draft/create_embedded_with_template', body: opts)
      end

      # Creates a new SignatureRequest from an Embedded UnclaimedDraft.
      # @option opts [String] signature_request_id The SignatureRequest ID to edit and resend.
      # @option opts [String] client_id The API App Client ID associated with the UnclaimedDraft.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [String] requesting_redirect_url Redirects the requester to this URL after sending a SignatureRequest. (optional)
      # @option opts [String] signing_redirect_url Redirects the signer(s) to this URL after completing the SignatureRequest. (optional)
      # @option opts [Boolean] is_for_embedded_signing Enable the UnclaimedDraft to be used for an Embedded SignatureRequest. Defaults to 0. (optional)
      #
      # @return [HelloSign::Resource::UnclaimedDraft] an UnclaimedDraft
      #
      # @example
      #   unclaimed_draft = @client.edit_and_resend_unclaimed_draft(
      #     signature_request_id: '75cdf7dc8b323d43b347e4a3614d1f822bd09491',
      #     test_mode: 1,
      #     client_id: 'b6b8e7deaf8f0b95c029dca049356d4a2cf9710a',
      #   )
      def edit_and_resend_unclaimed_draft(opts)
        signature_request_id = opts.delete(:signature_request_id)
        path = "/unclaimed_draft/edit_and_resend/#{signature_request_id}"

        HelloSign::Resource::UnclaimedDraft.new post(path, body: opts)
      end
    end
  end
end
