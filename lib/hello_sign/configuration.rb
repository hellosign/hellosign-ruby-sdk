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

  #
  # Define config attributes and default values for HelloSign module
  #
  # @author [hellosign]
  #
  module Configuration
    DEFAULT_ENDPOINT = 'https://api.hellosign.com'
    DEFAULT_API_VERSION = '/v3'
    DEFAULT_OAUTH_ENDPOINT = 'https://app.hellosign.com'
    VALID_OPTIONS_KEYS = [:end_point, :oauth_end_point, :api_version, :user_agent, :client_id, :client_secret, :email_address, :password, :api_key, :auth_token, :log_level, :logging, :proxy_uri, :proxy_user, :proxy_pass]


    DEFAULT_USER_AGENT = "hellosign-ruby-sdk/" + HelloSign::VERSION

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
      self.proxy_uri = nil
      self.proxy_user = nil
      self.proxy_pass = nil
    end
  end
end
