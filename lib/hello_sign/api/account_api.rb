=begin
#HelloSign API

#HelloSign v3 API

The version of the OpenAPI document: 3.0.0
Contact: apisupport@hellosign.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

require 'cgi'

module HelloSign
  class AccountApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create Account
    # Creates a new HelloSign Account that is associated with the specified `email_address`.
    # @param account_create_request [AccountCreateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [AccountCreateResponse]
    def account_create(account_create_request, opts = {})
      data, _status_code, _headers = account_create_with_http_info(account_create_request, opts)
      data
    end

    # Create Account
    # Creates a new HelloSign Account that is associated with the specified &#x60;email_address&#x60;.
    # @param account_create_request [AccountCreateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountCreateResponse, Integer, Hash)>] AccountCreateResponse data, response status code and response headers
    def account_create_with_http_info(account_create_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountApi.account_create ...'
      end
      # verify the required parameter 'account_create_request' is set
      if @api_client.config.client_side_validation && account_create_request.nil?
        fail ArgumentError, "Missing the required parameter 'account_create_request' when calling AccountApi.account_create"
      end
      # resource path
      local_var_path = '/account/create'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      post_body = {}
      form_params = opts[:form_params] || {}
      result = @api_client.generate_form_data(
        account_create_request,
        HelloSign::AccountCreateRequest.openapi_types
      )

      # form parameters
      if result[:has_file]
        form_params = opts[:form_params] || result[:params]
        header_params['Content-Type'] = 'multipart/form-data'
      else
        # http body (model)
        post_body = opts[:debug_body] || result[:params]
      end

      # return_type
      return_type = opts[:debug_return_type] || 'AccountCreateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"AccountApi.account_create",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      begin
        data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      rescue HelloSign::ApiError => e
        if e.code === 200
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::AccountCreateResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

        range_code = "4XX".split('').first
        range_code_left = "#{range_code}00".to_i
        range_code_right = "#{range_code}99".to_i
        if e.code >= range_code_left && e.code <= range_code_right
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::ErrorResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

      end

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountApi#account_create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Account
    # Returns the properties and settings of your Account.
    # @param [Hash] opts the optional parameters
    # @return [AccountGetResponse]
    def account_get(opts = {})
      data, _status_code, _headers = account_get_with_http_info(opts)
      data
    end

    # Get Account
    # Returns the properties and settings of your Account.
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountGetResponse, Integer, Hash)>] AccountGetResponse data, response status code and response headers
    def account_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountApi.account_get ...'
      end
      # resource path
      local_var_path = '/account'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      post_body = {}
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'AccountGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"AccountApi.account_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      begin
        data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      rescue HelloSign::ApiError => e
        if e.code === 200
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::AccountGetResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

        range_code = "4XX".split('').first
        range_code_left = "#{range_code}00".to_i
        range_code_right = "#{range_code}99".to_i
        if e.code >= range_code_left && e.code <= range_code_right
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::ErrorResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

      end

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountApi#account_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Account
    # Updates the properties and settings of your Account.
    # @param account_update_request [AccountUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [AccountGetResponse]
    def account_update(account_update_request, opts = {})
      data, _status_code, _headers = account_update_with_http_info(account_update_request, opts)
      data
    end

    # Update Account
    # Updates the properties and settings of your Account.
    # @param account_update_request [AccountUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountGetResponse, Integer, Hash)>] AccountGetResponse data, response status code and response headers
    def account_update_with_http_info(account_update_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountApi.account_update ...'
      end
      # verify the required parameter 'account_update_request' is set
      if @api_client.config.client_side_validation && account_update_request.nil?
        fail ArgumentError, "Missing the required parameter 'account_update_request' when calling AccountApi.account_update"
      end
      # resource path
      local_var_path = '/account'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      post_body = {}
      form_params = opts[:form_params] || {}
      result = @api_client.generate_form_data(
        account_update_request,
        HelloSign::AccountUpdateRequest.openapi_types
      )

      # form parameters
      if result[:has_file]
        form_params = opts[:form_params] || result[:params]
        header_params['Content-Type'] = 'multipart/form-data'
      else
        # http body (model)
        post_body = opts[:debug_body] || result[:params]
      end

      # return_type
      return_type = opts[:debug_return_type] || 'AccountGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"AccountApi.account_update",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      begin
        data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      rescue HelloSign::ApiError => e
        if e.code === 200
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::AccountGetResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

        range_code = "4XX".split('').first
        range_code_left = "#{range_code}00".to_i
        range_code_right = "#{range_code}99".to_i
        if e.code >= range_code_left && e.code <= range_code_right
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::ErrorResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

      end

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountApi#account_update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Verify Account
    # Verifies whether an HelloSign Account exists for the given email address.  **NOTE** This method is restricted to paid API users.
    # @param account_verify_request [AccountVerifyRequest] 
    # @param [Hash] opts the optional parameters
    # @return [AccountVerifyResponse]
    def account_verify(account_verify_request, opts = {})
      data, _status_code, _headers = account_verify_with_http_info(account_verify_request, opts)
      data
    end

    # Verify Account
    # Verifies whether an HelloSign Account exists for the given email address.  **NOTE** This method is restricted to paid API users.
    # @param account_verify_request [AccountVerifyRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountVerifyResponse, Integer, Hash)>] AccountVerifyResponse data, response status code and response headers
    def account_verify_with_http_info(account_verify_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountApi.account_verify ...'
      end
      # verify the required parameter 'account_verify_request' is set
      if @api_client.config.client_side_validation && account_verify_request.nil?
        fail ArgumentError, "Missing the required parameter 'account_verify_request' when calling AccountApi.account_verify"
      end
      # resource path
      local_var_path = '/account/verify'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      post_body = {}
      form_params = opts[:form_params] || {}
      result = @api_client.generate_form_data(
        account_verify_request,
        HelloSign::AccountVerifyRequest.openapi_types
      )

      # form parameters
      if result[:has_file]
        form_params = opts[:form_params] || result[:params]
        header_params['Content-Type'] = 'multipart/form-data'
      else
        # http body (model)
        post_body = opts[:debug_body] || result[:params]
      end

      # return_type
      return_type = opts[:debug_return_type] || 'AccountVerifyResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"AccountApi.account_verify",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      begin
        data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      rescue HelloSign::ApiError => e
        if e.code === 200
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::AccountVerifyResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

        range_code = "4XX".split('').first
        range_code_left = "#{range_code}00".to_i
        range_code_right = "#{range_code}99".to_i
        if e.code >= range_code_left && e.code <= range_code_right
          body = @api_client.convert_to_type(
            JSON.parse("[#{e.response_body}]", :symbolize_names => true)[0],
            "HelloSign::ErrorResponse"
          )

          fail ApiError.new(:code => e.code,
                            :response_headers => e.response_headers,
                            :response_body => body),
               e.message
        end

      end

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountApi#account_verify\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
