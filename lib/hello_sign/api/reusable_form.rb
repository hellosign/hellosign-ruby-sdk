module HelloSign
  module Api

    #
    # Contains all the api about the ReusableForm resource.
    # Take a look at our {https://www.hellosign.com/api/reference#ReusableForm reusable form api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module ReusableForm

      #
      # Retrieves the ReusableForm specified by the id parameter.
      # @option opts [String] reusable_form_id The id of the ReusableForm to retrieve.
      #
      # @return [HelloSign::Resource::ReusableForm] a ReusableForm object
      #
      # @example
      #   reusable_form = @client.get_reusable_form :reusable_form_id => 'f57db65d3f933b5316d398057a36176831451a35'
      #
      def get_reusable_form opts
        HelloSign::Resource::ReusableForm.new get("/reusable_form/#{opts[:reusable_form_id]}")
      end

      #
      # Retrieves the ReusableForms for the current user account.
      #
      # @option opts [Integer] page (1) Which page number of the ReusableForm List to return.
      #
      # @return [HelloSign::Resource::ResourceArray] a ResourceArray object
      # @example
      #   reusable_forms = @client.get_reusable_forms :page => 1
      #
      def get_reusable_forms opts={}
        path = '/reusable_form/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ""
        HelloSign::Resource::ResourceArray.new get(path, opts), "reusable_forms", HelloSign::Resource::ReusableForm
      end


      #
      # Gives the specified Account access to the specified ReusableForm
      #
      # @option opts [String] reusable_form_id The id of the ReusableForm to give the Account access to.
      # @option opts [String] account_id The id of the Account to give access to the ReusableForm. The account_id prevails if account_id and email_address are both provided.
      # @option opts [String] email_address The email address of the Account to give access to the ReusableForm. The account_id prevails if account_id and email_address are both provided.
      #
      # @return [ReusableForm] a ReusableForm object
      # @example
      #   reusable_forms = @client.add_user_to_reusable_form :reusable_form_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@hellosign.com'
      #
      def add_user_to_reusable_form opts
        path = "/reusable_form/add_user/#{opts[:reusable_form_id]}"
        opts.delete(:reusable_form_id)
        HelloSign::Resource::ReusableForm.new post(path, :body => opts)
      end

      #
      # Removes the specified Account's access to the specified ReusableForm.
      # The user can be designated using their account ID or email address.
      # @option opts [String] reusable_form_id The id of the ReusableForm to remove the Account access to.
      # @option opts [String] account_id The id of the Account to remove access to the ReusableForm. The account_id prevails if account_id and email_address are both provided.
      # @option opts [String] email_address The email address of the Account to remove access to the ReusableForm. The account_id prevails if account_id and email_address are both provided.
      #
      # @return [ReusableForm] a ReusableForm object
      # @example
      #   reusable_forms = @client.remove_user_from_reusable_form :reusable_form_id => 'f57db65d3f933b5316d398057a36176831451a35', :email_address => 'george@hellosign.com'
      #
      def remove_user_from_reusable_form opts
        path = "/reusable_form/remove_user/#{opts[:reusable_form_id]}"
        opts.delete(:reusable_form_id)
        HelloSign::Resource::ReusableForm.new post(path, :body => opts)
      end
    end
  end
end
