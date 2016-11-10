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
    # Contains all the api about the SignatureRequest resource.
    # Take a look at our {https://www.hellosign.com/api/reference#SignatureRequest signature request api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module SignatureRequest

      #
      # Retrieves a Signature Request with the given ID.
      # @option opts [String] signature_request_id The id of the SignatureRequest to retrieve.
      # @option opts [Integer] ux_version sets the version of the signer page to use
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
      # Returns a list of SignatureRequests that you can access. This includes SignatureRequests you have sent as well as received, but not ones that you have been CCed on.
      # @option opts[:page] [Integer] page (1) Which page number of the Template List to return.
      # @option opts[:ux_version] [Integer] ux_version sets the version of the signer page to use
      # @option opts[:query] [String] query string to search on, such as "title:Field Trip Release AND from:me"
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
        HelloSign::Resource::ResourceArray.new get(path, opts), 'signature_requests',  HelloSign::Resource::SignatureRequest
      end

      #
      # Creates and sends a new SignatureRequest with the submitted documents.
      # If form_fields_per_document is not specified, a signature page will be affixed at the end
      # and all signers will be required to add their signature there.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The title you want to assign to the SignatureRequest.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [String] signing_redirect_url The URL you want the signer redirected to after they successfully sign. (optional)
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Sender' name
      #   * :email_address (String) Sender's email address
      #   * :order (Integer) The order the signer is required to sign in
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature.
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed.
      # @option opts [String] form_fields_per_document
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
      #     :files => ['NDA.pdf', 'AppendixA.pdf']
      #   )
      #

      def send_signature_request(opts)
        prepare_files opts
        prepare_signers opts

        HelloSign::Resource::SignatureRequest.new post('/signature_request/send', :body => opts)
      end

      #
      # Creates and sends a new SignatureRequest based off of the Template specified with the template_id parameter.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [String] template_id The id of the Template to use when creating the SignatureRequest.
      # @option opts [String] title The title you want to assign to the SignatureRequest.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [String] signing_redirect_url The URL you want the signer redirected to after they successfully sign. (optional)
      # @option opts [Array<Hash>] signers List of signers
      #   * :name (String) Sender' name
      #   * :email_address (String) Sender's email address
      #   * :order (Integer) The order the signer is required to sign in
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature.
      # @option opts [Array<Hash>] ccs The email addresses CC destinations. Required when a CC role exists for the Template.
      # @option opts [Hash] custom_fields (deprecated) The value to fill in for the custom field with the name of CustomFieldName.
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present in the template. Only specify this when NOT specifying custom_fields by hash (the old way).
      # @option opts [Integer] ux_version sets the version of the signer page to use
      #
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
      #    :custom_fields =>
      #    {
      #      :CustomFieldName => '$20,000'
      #    }
      #  )
      #
      def send_signature_request_with_template(opts)
        prepare_signers opts
        prepare_ccs opts
        prepare_templates opts
        prepare_custom_fields opts

        HelloSign::Resource::SignatureRequest.new post('/signature_request/send_with_template', :body => opts)
      end

      #
      # Sends an email to the signer reminding them to sign the signature request.
      # @option opts [String] signature_request_id The id of the SignatureRequest to send a reminder for.
      # @option opts [String] email_address The email address of the signer to send a reminder to.
      # @option opts [Integer] ux_version sets the version of the signer page to use
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
      # @option opts [String] signature_request_id The id of the SignatureRequest to cancel.
      #
      # @example
      #   @client.cancel_signature_request :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491'
      def cancel_signature_request(opts)
        post("/signature_request/cancel/#{opts[:signature_request_id]}", :body => opts)
      end

      #
      # Download the PDF copy of the current documents specified by the signature_request_id parameter.
      # @option opts [String] file_type Either 'pdf' or 'zip' depending on the file type desired. Defaults to pdf.
      # @option opts [String] signature_request_id The id of the SignatureRequest to retrieve.
      #
      # @return a PDF
      #
      # @example
      #   pdf = @client.signature_request_files :signature_request_id => '75cdf7dc8b323d43b347e4a3614d1f822bd09491'
      #
      def signature_request_files(opts)
        path = "/signature_request/files/#{opts[:signature_request_id]}"
        if opts[:file_type]
          path = path + "?file_type=#{opts[:file_type]}"
        end
        get(path)
      end

      #
      # Creates a new SignatureRequest with the submitted documents to be signed in an embedded iFrame.
      # If form_fields_per_document is not specified, a signature page will be affixed where all signers will be required to add their signature, signifying their agreement to all contained documents.
      # Note that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on HelloSign.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [String] client_id Client id of the app you're using to create this embedded signature request. Visit our  {https://www.hellosign.com/api/reference#Embedded embedded page} page to learn more about this parameter.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The title you want to assign to the SignatureRequest.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [String] signing_redirect_url The URL you want the signer redirected to after they successfully sign. (optional)
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Sender' name
      #   * :email_address (String) Sender's email address
      #   * :order (Integer) The order the signer is required to sign in
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature.
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed.
      # @option opts [String] form_fields_per_document
      # @option opts [Integer] ux_version sets the version of the signer page to use
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

        HelloSign::Resource::SignatureRequest.new post('/signature_request/create_embedded', :body => opts)
      end

      #
      # Creates a new SignatureRequest based on the given Template to be signed in an embedded iFrame.
      # Note that embedded signature requests can only be signed in embedded iFrames whereas normal signature requests can only be signed on HelloSign.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [String] client_id Client id of the app you're using to create this embedded signature request. Visit our  {https://www.hellosign.com/api/reference#Embedded embedded page} page to learn more about this parameter.
      # @option opts [String] template_id The id of the Template to use when creating the SignatureRequest.
      # @option opts [String] title The title you want to assign to the SignatureRequest.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [String] signing_redirect_url The URL you want the signer redirected to after they successfully sign. (optional)
      # @option opts [Integer] hide_text_tags Whether or not your text tags hidden after parsing
      # @option opts [Integer] use_text_tags Whether or not your document contains parseable text-tags
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Sender' name
      #   * :email_address (String) Sender's email address
      #   * :order (Integer) The order the signer is required to sign in
      #   * :pin (Integer) The 4- to 12-character access code that will secure this signer's signature page. You must have a business plan to use this feature.
      # @option opts [Hash] ccs The email address of the CC filling the role of RoleName. Required when a CC role exists for the Template.
      # @option opts [Hash] custom_fields (deprecated) The value to fill in for custom field with the name of CustomFieldName.
      # @option opts [Array<Hash>] custom_fields An array of custom merge fields, representing those present in the template. Only specify this when NOT specifying custom_fields by hash (the old way)
      # @option opts [Integer] ux_version sets the version of the signer page to use
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

        HelloSign::Resource::SignatureRequest.new post('/signature_request/create_embedded_with_template', :body => opts)
      end
    end
  end
end
