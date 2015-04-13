module HelloSign
  module Api

    #
    # Contains all the api calls for the Template resource.
    # Take a look at our {https://www.hellosign.com/api/templatesAndApiWalkthrough template form api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module Template

      #
      # Retrieves the Template specified by the id parameter.
      # @option opts [String] template_id The id of the Template to retrieve.
      #
      # @return [HelloSign::Resource::Template] a Template object
      #
      # @example
      #   template = @client.get_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35'
      #
      def get_template(opts)
        HelloSign::Resource::Template.new get("/template/#{opts[:template_id]}")
      end

      #
      # Deletes the Template specified by the id parameter.
      # @option opts [String] template_id The id of the Template to delete.
      ##
      # @example
      #   template = @client.get_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35'
      #
      def delete_template(opts)
        post("/template/#{opts[:template_id]}")
      end

      #
      # Retrieves the Templates for the current user account.
      #
      # @option opts [Integer] page (1) Which page number of the Template List to return.
      #
      # @return [HelloSign::Resource::ResourceArray] a ResourceArray object
      # @example
      #   templates = @client.get_templates :page => 1
      #
      def get_templates(opts={})
        path = '/template/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ''
        HelloSign::Resource::ResourceArray.new get(path, opts), 'templates', HelloSign::Resource::Template
      end

      #
      # Gives the specified Account on your team access to a Template
      #
      # @option opts [String] template_id The id of the Template to give access to.
      # @option opts [String] account_id The id of the Account to get access. The account_id prevails if account_id and email_address are both provided.
      # @option opts [String] email_address The email address of the Account to give access to the Template. The account_id prevails if account_id and email_address are both provided.
      #
      # @return [Template] a Template object
      # @example
      #   templates = @client.add_user_to_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@example.com'
      #
      def add_user_to_template(opts)
        path = "/template/add_user/#{opts[:template_id]}"
        opts.delete(:template_id)
        HelloSign::Resource::Template.new post(path, :body => opts)
      end

      #
      # Removes the specified Account's access to the specified Template.
      # The user can be designated using their account ID or email address.
      # @option opts [String] template_id The id of the Template to remove the Account access to.
      # @option opts [String] account_id The id of the Account to remove access to the Template. The account_id prevails if account_id and email_address are both provided.
      # @option opts [String] email_address The email address of the Account to remove access to the Template. The account_id prevails if account_id and email_address are both provided.
      #
      # @return [Template] a Template object
      # @example
      #   templates = @client.remove_user_from_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@example.com'
      #
      def remove_user_from_template(opts)
        path = "/template/remove_user/#{opts[:template_id]}"
        opts.delete(:template_id)
        HelloSign::Resource::Template.new post(path, :body => opts)
      end

      #
      # Creates a new embedded template draft object that can be launched in an iframe using the claim URL.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] title The default template email subject.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] requester_email_address The email address of the requester.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [Array<Hash>] signers List of signer_roles, each item is a Hash with these keys:
      #   * :name (String) signer's role name
      #   * :order (Integer) The order the signer is required to sign in (optional)
      # @option opts [Array<Hash>] cc_roles The email addresses CC roles. Will mean the CC role will be Required when sending the template.
      # @option opts [Array<Hash>] merge_fields List of fields that can be pre-populated by your application when using the resulting template to send a signature request
      #   * :name (String) merge field name
      #   * :type (String) <text|checkbox>
      #
      # @example create_embedded_draft
      #   template_draft = @client.create_embedded_template_draft(
      #     :test_mode => 1,
      #     :subject => 'The NDA we talked about',
      #     :requester_email_address => requester@example.com",
      #     :message => 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     :signer_roles => [{
      #         :name => 'Manager',
      #         :order => 0
      #       },{
      #         :name => 'Client',
      #         :order => 1
      #       }
      #     ],
      #     :cc_roles => ['HRManager'],
      #     :files => ['NDA.pdf', 'AppendixA.pdf'],
      #     :merge_fields => '[{
      #         :name => 'contract_id',
      #         :type => 'text'
      #       },{
      #         :name => 'purchase_price',
      #         :order => 'text'
      #       }
      #     ]'
      #   )
      #
      def create_embedded_template_draft(opts)
        opts[:client_id] ||= self.client_id
        prepare_files opts
        prepare_signer_roles opts
        HelloSign::Resource::TemplateDraft.new post("/template/create_embedded_draft", :body => opts)
      end
    end
  end
end
