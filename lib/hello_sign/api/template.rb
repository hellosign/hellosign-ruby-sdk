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
    # Contains all the API calls for the Template resource.
    # Take a look at our API Documentation for Templates (https://app.hellosign.com/api/reference#Template)
    # for more information about this.
    #
    # @author [hellosign]

    module Template

      # Retrieves the Template with the given ID.
      # @option opts [String] template_id The ID of the Template to retrieve.
      #
      # @return [HelloSign::Resource::Template] a Template
      #
      # @example
      #   template = @client.get_template template_id: 'f57db65d3f933b5316d398057a36176831451a35'
      def get_template(opts)
        HelloSign::Resource::Template.new get("/template/#{opts[:template_id]}")
      end

      # Deletes the specified Template.
      # @option opts [String] template_id The ID of the Template to delete.
      #
      # @return [HTTP::Status] 200 OK
      #
      # @example
      #   template = @client.delete_template template_id: 'f57db65d3f933b5316d398057a36176831451a35'
      def delete_template(opts)
        post("/template/delete/#{opts[:template_id]}")
      end

      # Retrieves the Templates for the accessible by the current user.
      # @option opts [String] account_id The Account ID to return Templates for. Use "all" for all team members. Defaults to current account. (optional)
      # @option opts [Integer] page Sets the page number of the list to return. Defaults to 1. (optional)
      # @option opts [Integer] page_size Determines the number of Templates returned per page. Defaults to 20. (optional)
      # @option opts [String] query Search terms and/or fields to filter the Templates. (optional)
      #
      # @return [HelloSign::Resource::ResourceArray] a ResourceArray
      #
      # @example
      #   templates = @client.get_templates page: 1
      def get_templates(opts={})
        path = '/template/list'
        opts[:query] = create_search_string(opts[:query]) if opts[:query]
        query = create_query_string(opts, [:page, :page_size, :query])
        path += query
        HelloSign::Resource::ResourceArray.new get(path, opts), 'templates', HelloSign::Resource::Template
      end

      # Gives the specified Account access to a Template. The Account must be part of your Team.
      # @option opts [String] template_id The Template ID to give access to.
      # @option opts [String] account_id The Account ID to receive access to the Template.
      # @option opts [String] email_address The email address of the Account to receive access to the Template.
      # Note: The account_id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Template] a Template
      #
      # @example
      #   templates = @client.add_user_to_template template_id: 'f57db65d3f933b5316d398057a36176831451a35', email_address: 'george@example.com'
      def add_user_to_template(opts)
        path = "/template/add_user/#{opts[:template_id]}"
        opts.delete(:template_id)
        HelloSign::Resource::Template.new post(path, body: opts)
      end

      # Removes the specified Account access to the specified Template.
      # @option opts [String] template_id The Template ID to remove access to.
      # @option opts [String] account_id The Account ID to remove access to the Template.
      # @option opts [String] email_address The email address of the Account to remove access to the Template.
      # Note: The account_id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Template] a Template
      #
      # @example
      #   templates = @client.remove_user_from_template template_id: 'f57db65d3f933b5316d398057a36176831451a35', email_address: 'george@example.com'
      def remove_user_from_template(opts)
        path = "/template/remove_user/#{opts[:template_id]}"
        opts.delete(:template_id)
        HelloSign::Resource::Template.new post(path, body: opts)
      end

      # Creates a new Embedded Template draft object that can be launched in an iFrame using the claim_url.
      # @option opts [Boolean] test_mode Indicates if this is a test Template draft. SignatureRequests using this Template will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [String] client_id The API App Client ID associated with the Template draft. (optional)
      # @option opts [Array<String>] files Specified file path(s) to upload file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls URL(s) for HelloSign to download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The default Template title. (optional)
      # @option opts [String] subject The default Template title alias. (optional)
      # @option opts [String] message The default message in the email that will be sent to the signer(s). (optional)
      # @option opts [Array<Hash>] signers List of signers displayed when the Template is used to create a SignatureRequest
      #   * name (String) Signer role name
      #   * order (Integer) The order the signer role is required to sign in. (optional)
      # @option opts [Array<Hash>] attachments Sets a list of attachments signers can upload
      #   * name (String) Attachment name
      #   * instructions (String) Instructions for uploading the attachment. (optional)
      #   * signer_index (Integer) The signer's unique number.
      #   * required (Boolean) Determines if the signer is required to upload this attachment. Defaults to 0. (Optional)
      # @option opts [Array<Hash>] cc_roles The CC roles that must be assigned when using the Template to create a SignatureRequest. (optional)
      # @option opts [String<Array><Hash>] merge_fields List of fields that can be pre-populated by your application when using the Template to send a SignatureRequest. (optional)
      #   * name (String) Merge field name
      #   * type (String) Field type - either "text" or "checkbox"
      # @option opts [Boolean] skip_me_now Sets the "Me (Now)" option for the Template preparer. Defaults to 0. (optional)
      # @option opts [Boolean] use_preexisting_fields Sets the detection of predefined PDF fields. Defaults to 0. (optional)
      # @option opts [Hash] metadata Key-value data attached to the Template and all SignatureRequests created from the Template. (optional)
      # @option opts [Boolean] allow_reassign Sets the ability for signers to reassign the SignatureRequest to other signers. Defaults to 0. (optional)
      #
      # @return [HelloSign::Resource::Template] a Template
      #
      # @example
      #   template_draft = @client.create_embedded_template_draft(
      #     test_mode: 1,
      #     subject: 'The NDA we talked about',
      #     requester_email_address: 'requester@example.com',
      #     message: 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     signer_roles: [
      #       {
      #         name: 'Manager',
      #         order: 0
      #       },
      #       {
      #         name: 'Client',
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
      #     cc_roles: ['HRManager'],
      #     files: ['NDA.pdf', 'AppendixA.pdf'],
      #     merge_fields: '[
      #       {
      #         name: 'contract_id',
      #         type: 'text'
      #       },
      #       {
      #         name: 'purchase_price',
      #         order: 'text'
      #       }
      #     ]'
      #   )
      def create_embedded_template_draft(opts)
        opts[:client_id] ||= self.client_id
        prepare_files opts
        prepare_signer_roles opts
        prepare_attachments opts
        HelloSign::Resource::TemplateDraft.new post("/template/create_embedded_draft", body: opts)
      end

      # Downloads the original files of a specified Template.
      # @option opts [String] template_id The Template ID to retrieve.
      # @option opts [String] file_type Determines the format of the file - either 'pdf' or 'zip' depending on the file type desired. Defaults to pdf. (optional)
      # @option opts [Boolean] get_url Response contains a URL link to the file if set to true. Links are only available for PDFs and have a TTL of 3 days. Defaults to false. (optional)
      #
      # @return a PDF or Zip
      #
      # @example
      #   file = @client.get_template_files template_id: 'f57db65d3f933b5316d398057a36176831451a35', file_type: 'zip'
      def get_template_files(opts)
        path = "/template/files/#{opts[:template_id]}"
        if opts[:file_type]
          path = path + "?file_type=#{opts[:file_type]}"
        end
        if opts[:get_url]
          separator = opts[:file_type].nil? ? '?' : '&'
          path = path + "#{separator}get_url=#{opts[:get_url]}"
        end

        get(path)
      end

      # Overlays a new file with the overlay of the specified Template.
      # @option opts [String] template_id The Template ID to update.
      # @option opts [Array<String>] files Specified file path(s) to upload file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls URL(s) for HelloSign to download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] subject The updated default Template title alias. (optional)
      # @option opts [String] message The updated default message in the email that will be sent to the signer(s). (optional)
      # @option opts [String] client_id The API App Client ID associated with the Template. (optional)
      # @option opts [Boolean] test_mode Indicates if this is a test Template. SignatureRequests using this Template will not be legally binding if set to 1. Defaults to 0. (optional)
      #
      # @return a Template ID
      #
      # @example
      #   templates = @client.update_template_files template_id: 'f57db65d3f933b5316d398057a36176831451a35', file: '@NDA.pdf'
      #
      def update_template_files(opts)
        template_id = opts.delete(:template_id)
        path = "/template/update_files/#{template_id}"
        prepare_files opts

        HelloSign::Resource::Template.new post(path, body: opts)
      end
    end
  end
end
