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
    # Contains all the api calls for the ApiApp resource.
    # Take a look at our {https://www.hellosign.com/api/reference#Team team api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module ApiApp

      #
      # Retrieves information about a specific API App by a given ID
      #
      # @return [HelloSign::Resource::ApiApp] the API App
      #
      # @example
      #   app = @client.get_api_app :client_id => 'fa5c8a0b0f492d768749333ad6fcc214c111e967'
      #
      def get_api_app(opts)
        HelloSign::Resource::ApiApp.new get("/api_app/#{opts[:client_id]}")
      end

      #
      # Returns a list of ApiApps that you currently have access to on your account
      # @option opts [Integer] page (1) Which page number of the list to return.
      # @option opts [Integer] page_size (5) Number of results for each page
      #
      # @return [HelloSign::Resource::ResourceArray]
      #
      # @example
      #   apps = @client.get_api_apps :page => 1
      #
      def get_api_apps(opts={})
        path = '/api_app/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ''
        path += opts[:page_size] ? "&page_size=#{opts[:page_size]}" : ''
        HelloSign::Resource::ResourceArray.new get(path, opts), 'api_apps',  HelloSign::Resource::ApiApp
      end

      #
      # Creates a new API Application on your account
      # @option opts [String] name The name you want to assign to the ApiApp.
      # @option opts [String] domain The domain name the ApiApp will be associated with.
      # @option opts [String] callback_url (optional) The URL at which the ApiApp should receive event callbacks.
      # @option opts [String] custom_logo_file (optional) An image file to use as a custom logo in embedded contexts. (Only applies to some API plans)
      # @option opts [String] oauth[callback_url] (optional) The callback URL to be used for OAuth flows. (Required if oauth[scopes] is provided)
      # @option opts [String] oauth[scopes] (optional) A comma-separated list of OAuth scopes to be granted to the app. (Required if oauth[callback_url] is provided)
      #
      # @return [HelloSign::Resource::ApiApp] newly created ApiApp object
      #
      # @example
      #   app = @client.create_api_app :name => 'My Production App', :domain => 'example.com', :'oauth[callback_url]' => 'https://example.com/oauth', 'oauth[scopes]' => 'basic_account_info,request_signature'
      def create_api_app(opts)
        HelloSign::Resource::ApiApp.new post('/api_app', :body => opts)
      end

      #
      # Updates parameters for a specific API Application on your account, referenced by ID
      # @oprion opts [String] client_id (REQUIRED) The ID of the app you want to update
      # @option opts [String] name (optional) The name you want to assign to the ApiApp.
      # @option opts [String] domain (optional) The domain name the ApiApp will be associated with.
      # @option opts [String] callback_url (optional) The URL at which the ApiApp should receive event callbacks.
      # @option opts [String] custom_logo_file (optional) An image file to use as a custom logo in embedded contexts. (Only applies to some API plans)
      # @option opts [String] oauth[callback_url] (optional) The callback URL to be used for OAuth flows. (Required if oauth[scopes] is provided)
      # @option opts [String] oauth[scopes] (optional) A comma-separated list of OAuth scopes to be granted to the app. (Required if oauth[callback_url] is provided)
      #
      # @return [HelloSign::Resource::ApiApp] an ApiApp object
      #
      # @example
      #   app = @client.update_api_app :name => 'My Newly Renamed App', :domain => 'example2.com', :'oauth[callback_url]' => 'https://example2.com/oauth', 'oauth[scopes]' => 'basic_account_info,request_signature'
      def update_api_app(opts)
        id = opts.delete(:client_id)
        path = '/api_app/' + id
        HelloSign::Resource::ApiApp.new post(path, :body => opts)
      end

      #
      # Deletes an API App. Can only be invoked for apps you own.
      #
      # @example
      #   result = @client.delete_api_app :client_id => 'hdialuhfilaudshfa'
      def delete_api_app(opts)
        path = '/api_app/' + opts[:client_id]
        delete(path)
      end
    end
  end
end
