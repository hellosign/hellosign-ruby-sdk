module HelloSign
  module Api


    #
    # Contains all the api calls for the Account resource.
    # Take a look at our {https://www.hellosign.com/api/reference#Account account api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module Account

      #
      # Returns the current user's account information.
      #
      # @return [HelloSign::Resource::Account] current user's account
      #
      # @example
      #   account = @client.get_account
      #
      def get_account
        HelloSign::Resource::Account.new get("/account")
      end

      #
      # Creates a new HelloSign account. The user will still need to validate their email address
      # to complete the creation process.
      #
      # Note: This request does not require authentication.
      #
      # @option opts [String] email_address New user's email address
      # @option opts [String] password New user's password
      #
      # @return [HelloSign::Resource::Account] New user's account information
      #
      # @example
      #   account = @client.create_account :email_address => 'newuser@example.com', :password => 'securePW'
      #
      def create_account opts
        HelloSign::Resource::Account.new post("/account/create", :body => opts)
      end


      #
      # Updates the current user's callback URL
      # @option opts [String] callback_url New user's callback url
      #
      # @return [HelloSign::Resource::Account] Updated user's account information
      #
      # @example
      #   account = @client.update_account :callback_url => 'https://www.example.com/callback'
      #
      def update_account opts
        HelloSign::Resource::Account.new post("/account", :body => opts)
      end


      #
      # Check whether an account exists
      # @option opts [String] email_address user email
      #
      # @return [Bool] true if exists, else false
      # @example
      #   account = @client.verify :email_address => 'newuser@example.com'
      #
      def verify opts
        post("/account/verify", :body => opts).empty? ? false : true
      end
    end
  end
end
