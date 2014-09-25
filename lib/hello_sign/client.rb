require 'faraday'
require 'multi_json'
require 'hello_sign/error'
require 'hello_sign/configuration'
require 'hello_sign/resource'
require 'hello_sign/api'
require 'logger'

module HelloSign

  #
  # You'll need the HelloSign::Client to do just about everything, from creating
  # signatures to updating account information.
  #
  # @example
  #   client = HelloSign::Client.new :email_address => "me@hellosign.com", :password => "mypassword"
  #
  # @author [hellosign]
  class Client
    include Api::Account
    include Api::SignatureRequest
    include Api::Template
    include Api::Team
    include Api::UnclaimedDraft
    include Api::Embedded
    include Api::OAuth

    attr_accessor :end_point, :oauth_end_point, :api_version, :user_agent, :client_id, :client_secret, :email_address, :password, :api_key, :auth_token, :logging, :log_level

    ERRORS = {
      400 => Error::BadRequest,
      401 => Error::Unauthorized,
      402 => Error::PaidApiPlanRequired,
      403 => Error::Forbidden,
      404 => Error::NotFound,
      405 => Error::MethodNotAllowed,
      409 => Error::Conflict,
      410 => Error::Gone,
      500 => Error::InternalServerError,
      502 => Error::BadGateway,
      503 => Error::ServiceUnavailable
    }

    #
    # Creates a new HelloSign Client

    # @option opts [String] email_address email address
    # @option opts [String] password password
    # @option opts [String] api_key Api key
    # @return [HelloSign::Client] a new HelloSign::Client
    def initialize(opts={})
      options = HelloSign.options.merge(opts)
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        self.send("#{key}=", options[key])
      end
    end

    #
    # Make a http get request
    # @param  path [String] relative path of the request
    # @option options [Hash] params params of the url
    #
    def get(path, options={})
      response = request(path, :get, options)
      validate response
      parse response
    end

    #
    # Make a http post request
    # @param  path [String] relative path of the request
    # @option options [Hash] params params of the url
    # @option options [Hash] body request body
    #
    def post(path, options={})
      response = request(path, :post, options)
      validate response
      parse response
    end

    #
    # Make a http put request
    # @param  path [String] relative path of the request
    # @option options [Hash] params params of the url
    # @option options [Hash] body request body
    #
    def put(path, options={})
      response = request(path, :put, options)
      validate response
      parse response
    end

    #
    # Make a http delete request
    # @param  path [String] relative path of the request
    # @option options [Hash] params params of the url
    #
    def delete(path, options={})
      response = request(path, :delete, options)
      validate response
      parse response
    end

    private

    def request(path, method, options={})
      make_connection(options).send method do |request|
        if options[:oauth_request]
          request.url path, options[:params]
        else
          request.url "#{api_version}#{path}", options[:params]
        end
        request.body = options[:body]
      end
    end

    def make_connection options
      url = options[:oauth_request] ? oauth_end_point : end_point

      if @logging
        logger = Logger.new(STDOUT)
        logger.level = @log_level
      end

      connection = Faraday.new(:url => url, :headers => { user_agent: user_agent }) do |faraday|
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.response :logger, logger if @logging
        faraday.adapter :net_http
      end
      if options[:no_auth]
      elsif auth_token
        connection.authorization :Bearer, auth_token
      elsif api_key
        connection.basic_auth api_key, ''
      elsif email_address
        connection.basic_auth email_address, password
      else
      end
      connection
    end

    def validate(response)
      if response.status >= 400
        raise ERRORS[response.status].new error_message(response)
      end
    end

    def parse(response)
      if response['content-type'] == 'application/pdf'
        response.body
      elsif response.body.strip.empty?
        {}
      else
        MultiJson.load response.body
      end
    end

    def error_message(response)
      "Server responded with code #{response.status}\n" \
      "Request URI: #{response.to_hash[:url].to_s}\n"\
      "Message: #{response.body}"
    end

    def prepare_files(opts)
      if opts[:files]
        opts[:files].each_with_index do |file, index|
          if file.is_a? String
            opts[:"file[#{index}]"] = Faraday::UploadIO.new(file, 'application/pdf')
          elsif defined? ActionDispatch::Http::UploadedFile
            if file.is_a? ActionDispatch::Http::UploadedFile
              opts[:"file[#{index}]"] = UploadIO.new(file.tempfile, 'application/pdf')
            end
          else
            raise HelloSign::Error::NotSupportedType.new "#{file.class} is not a supported. Must be a string or ActionDispatch::Http::UploadedFile"
          end
        end
        opts.delete(:files)
      elsif opts[:file_urls]
        opts[:file_urls].each_with_index do |file, index|
          opts[:"file_url[#{index}]"] = file
        end
        opts.delete(:file_urls)
      end
    end

    def prepare_signers(opts)
      prepare opts, :signers
    end

    def prepare_ccs(opts)
      prepare opts, :ccs
    end

    def prepare_templates(opts)
      prepare opts, :template_ids
    end

    def prepare(opts, key)
      return unless opts[key]
      opts[key].each_with_index do |value, index|
        if value.is_a? String
          opts[:"#{key}[#{index}]"] = value
        else
          if value[:role]
            opts[:"#{key}[#{value[:role]}]"] = value
            value.delete(:role)
          else
            opts[:"#{key}[#{index}]"] = value
          end
        end
      end
      opts.delete(key)
    end
  end
end
