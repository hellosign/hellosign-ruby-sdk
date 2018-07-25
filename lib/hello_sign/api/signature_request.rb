#
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
#

module HelloSign
  module Api

    #
    # Contains all the API calls for the SignatureRequest resource.
    # Take a look at our API Documentation for sending Signature Requests (https://app.hellosign.com/api/reference#SignatureRequest)
    # for more information about this.
    #
    # @author [hellosign]
    #
    module SignatureRequest

      #
      # Retrieves a Signature Request with the given ID.
      # @option opts [String] signature_request_id The id of the SignatureRequest to retrieve.
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest object
      #
      # @example
      #   signature_request = @client.get_signature_request :signature_request_id => 'fa5c8a0b0f492d768749333ad6fcc214c111e967'
      #
      def get_signature_request(opts)
          path = "/signature_request/#{opts[:signature_request_id]}"
          query = create_query_string(opts, [:ux_version])
          path += query
        HelloSign::Resource::SignatureRequest.new get(path)
      end

      #
      # Returns a list of SignatureRequests that you can access. This includes SignatureRequests you have sent as well as received, but not ones that you have been CC'd on.
      # @option opts [String] account_id Indicates which account to return SignatureRequests for. Defaults to your account. (optional)
      # @option opts [Integer] page Sets the page number of the list to return. Defaults to 1. (optional)
      # @option opts [Integer] page_size Determines the number of SignatureRequests returned per page. Defaults to 20. (optional)
      # @option opts [String] query Search terms and/or fields to filter the SignatureRequests. (optional)
      #
      # @return [HelloSign::Resource::ResourceArray]
      #
      # @example
      #   signature_requests = @client.get_signature_requests :page => 1
      #
      def get_signature_requests(opts={})
        path = '/signature_request/list'
        opts[:query] = create_search_string(opts[:query]) if opts[:query]
        query = create_query_string(opts, [:page, :page_size, :ux_version, :query])
        path += query
        HelloSign::Resource::ResourceArray.new get(path, opts), 'signature_requests', HelloSign::Resource::SignatureRequest
      end

      #
      # Creates and sends a new SignatureRequest with the submitted documents.
      # If form_fields_per_document is not specified or use_text_tags is not enabled, a signature page will be affixed at the end
      # and all signers will be required to add their signature there.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. A boolean value is also accepted. Defaults to 0. (optional)
      # @option opts [Array<String>] files Specified file path(s) to upload file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls URL(s) for HelloSign to download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The title you want to assign to the SignatureRequest. (optional)
      # @option opts [String] subject The subject in the email that will be sent to the signer(s). (optional)
      # @option opts [String] message The custom message in the email that will be sent to the signer(s). (optional)
      # @option opts [String] signing_redirect_url The URL you want the signer(s) redirected to after they successfully sign. (optional)
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Signer's name
      #   * :email_address (String) Signer's email address
      #   * :order (Integer) The order the signers are required to sign in (optional)
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature. (optional)
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present on the document with Text Tags or form_fields_per_document (optional)
      #   * :name (String) Custom field name or "Field Label"
      #   * :value (String) The value of the field. This data will appear on the SignatureRequest.
      #   * :editor (String) The signer name indicated on the Text Tag or form_fields_per_document that can edit the value of the field. (optional)
      #   * :required (Boolean) Determines if the field is required or not. (optional)
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed on the SignatureRequest. (optional)
      # @option opts [Boolean] use_text_tags Indicates whether the SignatureRequest should have Text Tags enabled. Defaults to 0. (optional)
      # @option opts [Boolean] hide_text_tags Indicates whether the Text Tags should be removed automatically. Note that this is not the preferred method. Defaults to 0. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [String] client_id The API App Client ID associated with the SignatureRequest. (optional)
      # @option opts [Boolean] allow_decline Allows signers to decline the SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] allow_reassign Allows signers to reassign the SignatureRequest to another signer. Defaults to 0. (optional)
      # @option opts [Array<Hash>] form_fields_per_document The fields that should appear on the document. (optional)
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest
      #
      # @example
      #   signature_request = @client.send_signature_request(
      #     :test_mode => 1,
      #     :allow_decline => 1,
      #     :title => 'NDA with Acme Co.',
      #     :subject => 'The NDA we talked about',
      #     :message => 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     :metadata => {
      #      :client_id => '1234',
      #      :custom_text => 'NDA #9'
      #     },
      #     :signers => [{
      #         :email_address => 'jack@example.com',
      #         :name => 'Jack',
      #         :order => 0,
      #       },{
      #         :email_address => 'jill@example.com',
      #         :name => 'Jill',
      #         :order => 1,
      #       }
      #     ],
      #     :cc_email_addresses => ['lawyer@example.com', 'lawyer@example2.com'],
      #     :files => ['NDA.pdf', 'AppendixA.pdf'],
      #     :form_fields_per_document => [
            #   [
            #     {
            #       "name": "address",
            #       "type": "text",
            #       "x": 160,
            #       "y": 80,
            #       "width": 206,
            #       "height": 32,
            #       "signer": 0
            #     }
            #   ],
            #   [
            #     {
            #       "name": "phone",
            #       "type": "text",
            #       "x": 160,
            #       "y": 150,
            #       "width": 206,
            #       "height": 32,
            #       "signer": 1
            #       }
            #   ]
            # ]
      #   )
      #

      def send_signature_request(opts)
        prepare_files opts
        prepare_signers opts
        prepare_form_fields opts
        prepare_custom_fields opts

        request = HelloSign::Resource::SignatureRequest.new post('/signature_request/send', :body => opts)
      end

      #
      # Creates and sends a new SignatureRequest based off of the Template specified with the template_id parameter.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. A boolean value is also accepted. Defaults to 0. (optional)
      # @option opts [String] template_id The Template ID to use when creating the SignatureRequest.
      #   * Use template_ids[%i%] if using multiple templates, replacing %i% with an integer to indicate the order of the Templates
      # @option opts [String] title The title you want to assign to the SignatureRequest. (optional)
      # @option opts [String] subject The subject in the email that will be sent to the signer(s). (optional)
      # @option opts [String] message The custom message in the email that will be sent to the signer(s). (optional)
      # @option opts [String] signing_redirect_url The URL you want the signer(s) redirected to after they successfully sign. (optional)
      # @option opts [Array<Hash>] signers List of signers
      #   * :role (String) The signer role indicated on the Template. Note that the role name is case sensitive.
      #   * :name (String) Signer's name
      #   * :email_address (String) Signer's email address
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature. (optional)
      # @option opts [Array<Hash>] ccs The individual(s) to be CC'd on the SignatureRequest. Required when a CC role exists for the Template.
      #   * :role (String) The CC role indicated on the Template. Note that the role name is case sensitive.
      #   * :email_address (String) CC Recipient's email address
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present in the Template. (optional)
      #   * :name (String) Custom field name or "Field Label"
      #   * :value (String) The value of the field. This data will appear on the SignatureRequest.
      #   * :editor (String) The signer name indicated on the Text Tag or form_fields_per_document that can edit the value of the field. (optional)
      #   * :required (Boolean) Determines if the field is required or not. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [String] client_id The API App Client ID associated with the SignatureRequest. (optional)
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to append to the SignatureRequest. (optional)
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to append to the SignatureRequest. (optional)
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest
      # @example
      #  signature_request = @client.send_signature_request_with_template(
      #    :test_mode => 1,
      #    :allow_decline => 1,
      #    :template_ids => [
      #               'c26b8a16784a872da37ea946b9ddec7c1e11dff6',
      #               'c7ab48e9a9ee7102dd6229dbbc719abc7d90ff9f'
      #    ],
      #    :title => 'Purchase Order',
      #    :subject => 'Purchase Order',
      #    :message => 'Glad we could come to an agreement.',
      #    :metadata => {
      #      :client_id => '1234',
      #      :custom_text => 'NDA #9'
      #     },
      #    :signers => [
      #      {
      #        :email_address => 'george@example.com',
      #        :name => 'George',
      #        :role => 'Client'
      #      },
      #      {
      #        :email_address => 'mary@example.com',
      #        :name => 'Mary',
      #        :role => 'Manager'
      #      }
      #    ]
      #  )
      # @example
      #  signature_request = @client.send_signature_request_with_template(
      #    :test_mode => 1,
      #    :allow_decline => 0,
      #    :template_id => 'c26b8a16784a872da37ea946b9ddec7c1e11dff6',
      #    :title => 'Purchase Order',
      #    :subject => 'Purchase Order',
      #    :message => 'Glad we could come to an agreement.',
      #    :files => ['NDA.pdf', 'AppendixA.pdf'],
      #    :metadata => {
      #      :client_id => '1234',
      #      :custom_text => 'NDA #9'
      #     },
      #    :signers => [
      #      {
      #        :email_address => 'george@example.com',
      #        :name => 'George',
      #        :role => 'Client'
      #      }
      #    ],
      #    :ccs => [
      #      {
      #        :email_address =>'accounting@example.com',
      #        :role => "Accounting"
      #      }
      #    ],
      #    :custom_fields => [
      #     {
      #       :CustomFieldName => '$20,000'
      #     }
      #   ]
      #  )
      #
      def send_signature_request_with_template(opts)
        prepare_signers opts
        prepare_ccs opts
        prepare_templates opts
        prepare_custom_fields opts
        prepare_files opts

        HelloSign::Resource::SignatureRequest.new post('/signature_request/send_with_template', :body => opts)
      end

      #
      # Sends an email to the signer reminding them to sign the signature request.
      # @option opts [String] signature_request_id Indicates the ID of the SignatureRequest to send a reminder.
      # @option opts [String] email_address The email address of the signer who will receive a reminder.
      # @option opts [String] name The name of the signer who will receive a reminder. (optional)
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest
      # @example
      #   signature_request = @client.remind_signature_request :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491', :email_address => 'john@example.com'
      #
      def remind_signature_request(opts)
        HelloSign::Resource::SignatureRequest.new post("/signature_request/remind/#{opts[:signature_request_id]}", :body => opts)
      end

      #
      # Cancels a SignatureRequest.
      # @option opts [String] signature_request_id The ID of the incomplete SignatureRequest to cancel.
      #
      # @example
      #   @client.cancel_signature_request :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491'
      def cancel_signature_request(opts)
        post("/signature_request/cancel/#{opts[:signature_request_id]}", :body => opts)
      end

      #
      # Removes your access to a completed a SignatureRequest.
      # @option opts [String] signature_request_id The ID of the completed SignatureRequest to remove access.
      #
      # @example
      #   @client.remove_signature_request :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491'
      def remove_signature_request(opts)
        post("/signature_request/remove/#{opts[:signature_request_id]}", :body => opts)
      end

      #
      # Download a copy of the SignatureRequest documents specified by the signature_request_id parameter.
      # @option opts [String] signature_request_id The ID of the SignatureRequest to download.
      # @option opts [String] file_type Determines the format of the file - either 'pdf' or 'zip' depending on the file type desired. Defaults to pdf. (optional)
      # @option opts [Boolean] get_url Response contains a URL link to the file if set to true. Links are only available for PDFs and have a TTL of 3 days. Defaults to false. (optional)
      #
      # @return a PDF or Zip
      #
      # @example
      #   pdf = @client.signature_request_files :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491'
      #
      def signature_request_files(opts)
        path = "/signature_request/files/#{opts[:signature_request_id]}"
        if opts[:file_type]
          path = path + "?file_type=#{opts[:file_type]}"
        end
        if opts[:get_url]
          separator = opts[:file_type].nil? ? '?' : '&'
          path = path + "#{separator}get_url=#{opts[:get_url]}"
        end
        get(path)
      end

      #
      # Creates a new SignatureRequest with the submitted documents to be signed in an embedded iFrame.
      # If form_fields_per_document is not specified or use_text_tags is not enabled, a signature page will be affixed at the end
      # and all signers will be required to add their signature there.
      # Note that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on HelloSign.com.
      # See our Embedded Signing Walkthrough for more information on Embedded Signing: https://app.hellosign.com/api/embeddedSigningWalkthrough
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. A boolean value is also accepted. Defaults to 0. (optional)
      # @option opts [String] client_id The API App Client ID associated with the this embedded SignatureRequest.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The title you want to assign to the SignatureRequest. (optional)
      # @option opts [String] subject The subject in the email that will be sent to the signer(s). (optional)
      # @option opts [String] message The custom message in the email that will be sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Signer's name
      #   * :email_address (String) Signer's email address
      #   * :order (Integer) The order the signers are required to sign in (optional)
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature. (optional)
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present on the document with Text Tags or form_fields_per_document (optional)
      #   * :name (String) Custom field name or "Field Label"
      #   * :value (String) The value of the field. This data will appear on the SignatureRequest
      #   * :editor (String) The signer name indicated on the Text Tag or form_fields_per_document that can edit the value of the field. (optional)
      #   * :required (Boolean) Determines if the field is required or not. (optional)
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed on the SignatureRequest. (optional)
      # @option opts [Boolean] use_text_tags Indicates whether the SignatureRequest should have Text Tags enabled. Defaults to 0. (optional)
      # @option opts [Boolean] hide_text_tags Indicates whether the Text Tags should be removed automatically. Note that this is not the preferred method. Defaults to 0. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [Boolean] allow_decline Allows signers to decline the SignatureRequest. Defaults to 0. (optional)
      # @option opts [Boolean] allow_reassign Allows signers to reassign the SignatureRequest to another signer. Defaults to 0. (optional)
      # @option opts [Array<Hash>] form_fields_per_document The fields that should appear on the document. (optional)
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest
      # @example
      #   request = @client.create_embedded_signature_request(
      #     :test_mode => 1,
      #     :allow_decline => 1,
      #     :client_id => 'b6b8e7deaf8f0b95c029dca049356d4a2cf9710a',
      #     :title => 'NDA with Acme Co.',
      #     :subject => 'The NDA we talked about',
      #     :message => 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     :metadata => {
      #      :client_id => '1234',
      #      :custom_text => 'NDA #9'
      #     },
      #     :signers => [{
      #         :email_address => 'jack@example.com',
      #         :name => 'Jack',
      #         :order => 0,
      #       },{
      #         :email_address => 'jill@example.com',
      #         :name => 'Jill',
      #         :order => 1,
      #       }
      #     ],
      #     :cc_email_addresses => ['lawyer@example.com', 'lawyer@example2.com'],
      #     :files => ['NDA.pdf', 'AppendixA.pdf']
      #   )
      #
      def create_embedded_signature_request(opts)
        opts[:client_id] ||= self.client_id
        prepare_files opts
        prepare_signers opts
        prepare_form_fields opts
        prepare_custom_fields opts

        HelloSign::Resource::SignatureRequest.new post('/signature_request/create_embedded', :body => opts)
      end

      #
      # Creates a new SignatureRequest based on the given Template to be signed in an embedded iFrame.
      # Note that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on HelloSign.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. A boolean value is also accepted. Defaults to 0. (optional)
      # @option opts [String] client_id The API App Client ID associated with the this embedded SignatureRequest.
      # @option opts [String] template_id The Template ID to use when creating the SignatureRequest.
      #   * Use template_ids[%i%] if using multiple templates, replacing %i% with an integer to indicate the order of the Templates
      # @option opts [String] title The title you want to assign to the SignatureRequest. (optional)
      # @option opts [String] subject The subject in the email that will be sent to the signer(s). (optional)
      # @option opts [String] message The custom message in the email that will be sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers List of signers
      #   * :role (String) The signer role indicated on the Template. Note that the role name is case sensitive.
      #   * :name (String) Signer's name
      #   * :email_address (String) Signer's email address
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature. (optional)
      # @option opts [Array<Hash>] ccs The individual(s) to be CC'd on the SignatureRequest. Required when a CC role exists for the Template.
      #   * :role (String) The CC role indicated on the Template. Note that the role name is case sensitive.
      #   * :email_address (String) CC Recipient's email address
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present in the Template. (optional)
      #   * :name (String) Custom field name or "Field Label"
      #   * :value (String) The value of the field. This data will appear on the SignatureRequest.
      #   * :editor (String) The signer name indicated on the Text Tag or form_fields_per_document that can edit the value of the field. (optional)
      #   * :required (Boolean) Determines if the field is required or not. (optional)
      # @option opts [Hash] metadata Key-value data attached to the SignatureRequest. (optional)
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to append to the SignatureRequest. (optional)
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to append to the SignatureRequest. (optional)
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest
      # @example
      #   request = @client.create_embedded_signature_request_with_template(
      #     :test_mode => 1,
      #     :allow_decline => 1,
      #     :client_id => 'b6b8e7deaf8f0b95c029dca049356d4a2cf9710a',
      #     :template_id => 'c26b8a16784a872da37ea946b9ddec7c1e11dff6',
      #     :title => 'Purchase Order',
      #     :subject => 'Purchase Order',
      #     :message => 'Glad we could come to an agreement.',
      #     :files => ['NDA.pdf', 'AppendixA.pdf'],
      #     :metadata => {
      #      :client_id => '1234',
      #      :custom_text => 'NDA #9'
      #     },
      #     :signers => [
      #       {
      #         :email_address => 'george@example.com',
      #         :name => 'George',
      #         :role => 'Client'
      #       }
      #     ],
      #     :ccs => [
      #       {
      #         :email_address =>'accounting@example.com',
      #         :role => "Accounting"
      #       }
      #     ],
      #     :custom_fields => {
      #       :Cost => '$20,000'
      #     }
      #   )
      #
      def create_embedded_signature_request_with_template(opts)
        opts[:client_id] ||= self.client_id
        prepare_signers opts
        prepare_ccs opts
        prepare_templates opts
        prepare_custom_fields opts
        prepare_files opts

        HelloSign::Resource::SignatureRequest.new post('/signature_request/create_embedded_with_template', :body => opts)
      end

      #
      # Updates the email address on a SignatureRequest.
      # @option opts [String] signature_request_id The ID of the SignatureRequest to update.
      # @option opts [String] signature_id The Signature ID of the recipient to update.
      # @option opts [String] email_address The new email address of the recipient.
      #
      # @example
      #   @client.update_signature_request(
      #   :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491',
      #   :signature_id => '5064ca698bde9581ad75f6d62450eb4b',
      #   :email_address => 'newEmail@example.com'
      #   )

      def update_signature_request(opts)
        signature_request_id = opts.delete(:signature_request_id)
        path = "/signature_request/update/#{signature_request_id}"
        HelloSign::Resource::SignatureRequest.new post(path, :body => opts)
      end
    end
  end
end
