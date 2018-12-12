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
    # Contains all the API calls for the ApiApp resource.
    # Take a look at our API Documentation on ApiApps (https://app.hellosign.com/api/reference#ApiApp)
    # for more information about this.
    #
    # @author [hellosign]

    module ApiApp

      # Retrieves an ApiApp with a given ID
      # @option opts [String] client_id The Client ID of the ApiApp.
      #
      # @return [HelloSign::Resource::ApiApp]
      #
      # @example
      #   app = @client.get_api_app client_id: 'fa5c8a0b0f492d768749333ad6fcc214c111e967'
      def get_api_app(opts)
        HelloSign::Resource::ApiApp.new get("/api_app/#{opts[:client_id]}")
      end

      # Returns a list of ApiApps that your Account can access.
      # @option opts [Integer] page Sets the page number of the list to return. Defaults to 1. (optional)
      # @option opts [Integer] page_size Determines the number of ApiApps returned per page. Defaults to 20. (optional)
      #
      # @return [HelloSign::Resource::ResourceArray]
      #
      # @example
      #   apps = @client.get_api_apps page: 1
      def get_api_apps(opts={})
        path = '/api_app/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ''
        path += opts[:page_size] ? "&page_size=#{opts[:page_size]}" : ''
        HelloSign::Resource::ResourceArray.new get(path, opts), 'api_apps',  HelloSign::Resource::ApiApp
      end

      # Creates a new ApiApp on your Account
      # @option opts [String] name The name assigned to the ApiApp.
      # @option opts [String] domain The domain associated with the ApiApp.
      # @option opts [String] callback_url The URL that will receive callback events for the ApiApp. (optional)
      # @option opts [String] custom_logo_file An image file to use as a custom logo in embedded workflows, if available in the API subscription. (optional)
      # @option opts [String] oauth[callback_url] The callback URL to be used for OAuth flows. (optional)
      # @option opts [String] oauth[scopes] A comma-separated list of OAuth scopes to be granted to the app. (optional)
      # @option opts [String<Hash>] white_labeling_options Object with elements and values serialized to a string to customize the signer page, if available in the API subscription. (optional)
      # @option opts [Boolean] options[can_insert_everywhere] Determines if signers can "Insert Everywhere" when signing a document. (optional)
      #
      # @return [HelloSign::Resource::ApiApp] newly created ApiApp
      #
      # @example
      #   app = @client.create_api_app(
      #     name: 'My Production App',
      #     domain: 'example.com',
      #     'oauth[callback_url]': 'https://example.com/oauth',
      #     'oauth[scopes]': 'basic_account_info,request_signature'
      #   )
      def create_api_app(opts)
        HelloSign::Resource::ApiApp.new post('/api_app', body: opts)
      end

      # Updates the ApiApp settings.
      # @option opts [String] client_id The Client ID of the ApiApp you want to update.
      # @option opts [String] name The name assigned to the ApiApp. (optional)
      # @option opts [String] domain The domain associated with the ApiApp. (optional)
      # @option opts [String] callback_url The URL that will receive callback events for the ApiApp. (optional)
      # @option opts [String] custom_logo_file An image file to use as a custom logo in embedded workflows, if available in the API subscription. (optional)
      # @option opts [String] oauth[callback_url] The callback URL to be used for OAuth flows. (optional)
      # @option opts [String] oauth[scopes] A comma-separated list of OAuth scopes to be granted to the app. (optional)
      # @option opts [String<Hash>] white_labeling_options Object with elements and values serialized to a string to customize the signer page, if available in the API subscription. (optional)
      # @option opts [Boolean] options[can_insert_everywhere] Determines if signers can "Insert Everywhere" when signing a document. (optional)
      #
      # @return [HelloSign::Resource::ApiApp] an ApiApp object
      #
      # @example
      #   app = @client.update_api_app(
      #     name: 'My Newly Renamed App',
      #     domain: 'example2.com',
      #     'oauth[callback_url]': 'https://example2.com/oauth',
      #     'oauth[scopes]': 'basic_account_info, request_signature'
      #   )
      def update_api_app(opts)
        id = opts.delete(:client_id)
        path = '/api_app/' + id
        HelloSign::Resource::ApiApp.new post(path, body: opts)
      end

      # Deletes an ApiApp. Only available for ApiApps you own.
      # @option opts [String] client_id The Client ID of the ApiApp you want to delete.
      #
      # @return [HTTP::Status] 204 No Content
      #
      # @example
      #   response = @client.delete_api_app client_id: 'fa5c8a0b0f492d768749333ad6fcc214c111e967'
      def delete_api_app(opts)
        path = '/api_app/' + opts[:client_id]
        delete(path)
      end
    end
  end
end
