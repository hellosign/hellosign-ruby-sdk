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
      def get_template opts
        HelloSign::Resource::Template.new get("/reusable_form/#{opts[:template_id]}")
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
      def get_templates opts={}
        path = '/reusable_form/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ""
        HelloSign::Resource::ResourceArray.new get(path, opts), "reusable_forms", HelloSign::Resource::Template
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
      #   templates = @client.add_user_to_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@hellosign.com'
      #
      def add_user_to_template opts
        path = "/reusable_form/add_user/#{opts[:template_id]}"
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
      #   templates = @client.remove_user_from_template :template_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@hellosign.com'
      #
      def remove_user_from_template opts
        path = "/reusable_form/remove_user/#{opts[:template_id]}"
        opts.delete(:template_id)
        HelloSign::Resource::Template.new post(path, :body => opts)
      end
    end
  end
end
