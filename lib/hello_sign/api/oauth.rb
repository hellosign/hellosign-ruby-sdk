module HelloSign
  module Api

    #
    # OAuth allows you to perform actions on behalf of other users after they grant you the authorization to do so. For example, you could send signature requests on behalf of your users. This page lays out the basic steps to do that.
    #
    # IMPORTANT
    #
    # With OAuth, you (the app owner) will be charged for all signature requests sent on behalf of other users via your app.
    #
    # @author [hellosign]
    #
    module OAuth

      #
      # Return the oath url which user can give permission for your application to perform actions on behalf of them
      # @param  state [String] use for security and must match throughout the flow for a given user. It can be set to the value of your choice (preferably something random). You should verify it matches the expected value when getting an OAuth callback.
      #
      # @return [type] [description]
      def oauth_url state
        "#{self.oauth_end_point}/oauth/authorize?response_type=code&client_id=#{self.client_id}&state=#{state}"
      end

      #
      # Retrieving the OAuth token
      #
      # @option opts [String] state variable that use when create oauth_url for specific user
      # @option opts [String] code The code passed to your callback when the user granted access
      #
      # @return [Hash] oauth data of the user
      def get_oauth_token opts
        opts[:client_id] = self.client_id
        opts[:client_secret] = self.client_secret
        opts[:grant_type] = 'authorization_code'
        post('/oauth/token', {:body => opts, :oauth_request => true})

      end


      #
      # refresh user oauth token.
      #
      # @return [Hash] refreshed oauth info
      def refresh_oauth_token refresh_token
        post('/oauth/token', {:body => {:grant_type => 'refresh_token', :refresh_token => refresh_token}, :oauth_request => true})
      end


      #
      # Create new user and get their OAuth token. The user will receive an email asking them to confirm the access being granted. Your app will not be able to perform actions on behalf of users this way until they confirm.
      # @option opts [String] email_address new user email address
      # @option opts [String] password new user password
      #
      # @return [Hash] detail about new user, include oath data
      def oauth_create_account opts
        opts[:client_id] = self.client_id
        opts[:client_secret] = self.client_secret

        HelloSign::Resource::Account.new post('/account/create', {:body => opts})
      end
    end
  end
end
