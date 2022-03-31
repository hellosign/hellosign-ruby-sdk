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
  class TeamApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Add User to Team
    # Invites a user (specified using the `email_address` parameter) to your Team. If the user does not currently have a HelloSign Account, a new one will be created for them. If a user is already a part of another Team, a `team_invite_failed` error will be returned.
    # @param team_add_member_request [TeamAddMemberRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TeamGetResponse]
    def team_add_member(team_add_member_request, opts = {})
      data, _status_code, _headers = team_add_member_with_http_info(team_add_member_request, opts)
      data
    end

    # Add User to Team
    # Invites a user (specified using the &#x60;email_address&#x60; parameter) to your Team. If the user does not currently have a HelloSign Account, a new one will be created for them. If a user is already a part of another Team, a &#x60;team_invite_failed&#x60; error will be returned.
    # @param team_add_member_request [TeamAddMemberRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TeamGetResponse, Integer, Hash)>] TeamGetResponse data, response status code and response headers
    def team_add_member_with_http_info(team_add_member_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_add_member ...'
      end
      # verify the required parameter 'team_add_member_request' is set
      if @api_client.config.client_side_validation && team_add_member_request.nil?
        fail ArgumentError, "Missing the required parameter 'team_add_member_request' when calling TeamApi.team_add_member"
      end
      # resource path
      local_var_path = '/team/add_member'

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
        team_add_member_request,
        HelloSign::TeamAddMemberRequest.openapi_types
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
      return_type = opts[:debug_return_type] || 'TeamGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_add_member",
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
            "HelloSign::TeamGetResponse"
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
        @api_client.config.logger.debug "API called: TeamApi#team_add_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create Team
    # Creates a new Team and makes you a member. You must not currently belong to a Team to invoke.
    # @param team_create_request [TeamCreateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TeamGetResponse]
    def team_create(team_create_request, opts = {})
      data, _status_code, _headers = team_create_with_http_info(team_create_request, opts)
      data
    end

    # Create Team
    # Creates a new Team and makes you a member. You must not currently belong to a Team to invoke.
    # @param team_create_request [TeamCreateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TeamGetResponse, Integer, Hash)>] TeamGetResponse data, response status code and response headers
    def team_create_with_http_info(team_create_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_create ...'
      end
      # verify the required parameter 'team_create_request' is set
      if @api_client.config.client_side_validation && team_create_request.nil?
        fail ArgumentError, "Missing the required parameter 'team_create_request' when calling TeamApi.team_create"
      end
      # resource path
      local_var_path = '/team/create'

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
        team_create_request,
        HelloSign::TeamCreateRequest.openapi_types
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
      return_type = opts[:debug_return_type] || 'TeamGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_create",
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
            "HelloSign::TeamGetResponse"
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
        @api_client.config.logger.debug "API called: TeamApi#team_create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete Team
    # Deletes your Team. Can only be invoked when you have a Team with only one member (yourself).
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def team_delete(opts = {})
      team_delete_with_http_info(opts)
      nil
    end

    # Delete Team
    # Deletes your Team. Can only be invoked when you have a Team with only one member (yourself).
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def team_delete_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_delete ...'
      end
      # resource path
      local_var_path = '/team/destroy'

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
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_delete",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      begin
        data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      rescue HelloSign::ApiError => e
      end

      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TeamApi#team_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get Team
    # Returns information about your Team as well as a list of its members. If you do not belong to a Team, a 404 error with an error_name of \"not_found\" will be returned.
    # @param [Hash] opts the optional parameters
    # @return [TeamGetResponse]
    def team_get(opts = {})
      data, _status_code, _headers = team_get_with_http_info(opts)
      data
    end

    # Get Team
    # Returns information about your Team as well as a list of its members. If you do not belong to a Team, a 404 error with an error_name of \&quot;not_found\&quot; will be returned.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TeamGetResponse, Integer, Hash)>] TeamGetResponse data, response status code and response headers
    def team_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_get ...'
      end
      # resource path
      local_var_path = '/team'

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
      return_type = opts[:debug_return_type] || 'TeamGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_get",
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
            "HelloSign::TeamGetResponse"
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
        @api_client.config.logger.debug "API called: TeamApi#team_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove User from Team
    # Removes the provided user Account from your Team. If the Account had an outstanding invitation to your Team, the invitation will be expired. If you choose to transfer documents from the removed Account to an Account provided in the `new_owner_email_address` parameter (available only for Enterprise plans), the response status code will be 201, which indicates that your request has been queued but not fully executed.
    # @param team_remove_member_request [TeamRemoveMemberRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TeamGetResponse]
    def team_remove_member(team_remove_member_request, opts = {})
      data, _status_code, _headers = team_remove_member_with_http_info(team_remove_member_request, opts)
      data
    end

    # Remove User from Team
    # Removes the provided user Account from your Team. If the Account had an outstanding invitation to your Team, the invitation will be expired. If you choose to transfer documents from the removed Account to an Account provided in the &#x60;new_owner_email_address&#x60; parameter (available only for Enterprise plans), the response status code will be 201, which indicates that your request has been queued but not fully executed.
    # @param team_remove_member_request [TeamRemoveMemberRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TeamGetResponse, Integer, Hash)>] TeamGetResponse data, response status code and response headers
    def team_remove_member_with_http_info(team_remove_member_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_remove_member ...'
      end
      # verify the required parameter 'team_remove_member_request' is set
      if @api_client.config.client_side_validation && team_remove_member_request.nil?
        fail ArgumentError, "Missing the required parameter 'team_remove_member_request' when calling TeamApi.team_remove_member"
      end
      # resource path
      local_var_path = '/team/remove_member'

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
        team_remove_member_request,
        HelloSign::TeamRemoveMemberRequest.openapi_types
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
      return_type = opts[:debug_return_type] || 'TeamGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_remove_member",
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
            "HelloSign::TeamGetResponse"
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
        @api_client.config.logger.debug "API called: TeamApi#team_remove_member\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update Team
    # Updates the name of your Team.
    # @param team_update_request [TeamUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [TeamGetResponse]
    def team_update(team_update_request, opts = {})
      data, _status_code, _headers = team_update_with_http_info(team_update_request, opts)
      data
    end

    # Update Team
    # Updates the name of your Team.
    # @param team_update_request [TeamUpdateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TeamGetResponse, Integer, Hash)>] TeamGetResponse data, response status code and response headers
    def team_update_with_http_info(team_update_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TeamApi.team_update ...'
      end
      # verify the required parameter 'team_update_request' is set
      if @api_client.config.client_side_validation && team_update_request.nil?
        fail ArgumentError, "Missing the required parameter 'team_update_request' when calling TeamApi.team_update"
      end
      # resource path
      local_var_path = '/team'

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
        team_update_request,
        HelloSign::TeamUpdateRequest.openapi_types
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
      return_type = opts[:debug_return_type] || 'TeamGetResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['api_key', 'oauth2']

      new_options = opts.merge(
        :operation => :"TeamApi.team_update",
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
            "HelloSign::TeamGetResponse"
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
        @api_client.config.logger.debug "API called: TeamApi#team_update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
