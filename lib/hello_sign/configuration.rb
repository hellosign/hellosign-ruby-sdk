module HelloSign


  #
  # Define config attributes and default values for HelloSign module
  #
  # @author [hellosign]
  #
  module Configuration
    DEFAULT_ENDPOINT = 'https://api.hellosign.com'
    DEFAULT_API_VERSION = '/v3'
    DEFAULT_OAUTH_ENDPOINT = "https://www.hellosign.com"
    VALID_OPTIONS_KEYS = [:end_point, :oauth_end_point, :api_version, :user_agent, :client_id, :client_secret, :email_address, :password, :api_key, :auth_token, :log_level, :logging]


    DEFAULT_USER_AGENT = "hellosign-ruby-sdk #{HelloSign::VERSION}"

    attr_accessor *VALID_OPTIONS_KEYS

    # Sets all configuration options to their default values
    # when this module is extended.
    #
    # @param base [Object] new module or class extend thid module
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block.
    def configure
      yield self
    end

    # Creates a hash of options
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.email_address = nil
      self.client_id = nil
      self.client_secret = nil
      self.auth_token = nil
      self.password = nil
      self.api_key = nil
      self.end_point = DEFAULT_ENDPOINT
      self.oauth_end_point = DEFAULT_OAUTH_ENDPOINT
      self.api_version = DEFAULT_API_VERSION
      self.user_agent = DEFAULT_USER_AGENT
      self.log_level = 3
      self.logging = true
    end
  end
end
