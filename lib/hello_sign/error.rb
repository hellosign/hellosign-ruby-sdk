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
  module Error

    # Custom error class for rescuing from all HelloSign errors.
    class Error < StandardError;
      attr_accessor :request_uri, :response_body, :response_status

      def initialize(response_status, response_body = nil, request_uri)
        @request_uri = request_uri
        @response_body = response_body
        @response_status = response_status
        super(human_readable_message)
      end

      private
      def human_readable_message
        "Server responded with code #{@response_status}\n" \
          "Request URI: #{@request_uri}\n"\
          "Message: #{@response_body}"
      end
    end

    # Raised when attributes are missing.
    class MissingAttributes < Error; end

    # Raised when API endpoint credentials not configured.
    class MissingCredentials < Error; end

    # Raised when impossible to parse response body.
    class Parsing < Error; end

    # Raised when API endpoint returns the HTTP status code 400.
    class BadRequest < Error; end

    # Raised when API endpoint returns the HTTP status code 401.
    class Unauthorized < Error; end

    # Raised when API endpoint returns the HTTP status code 402.
    class PaidApiPlanRequired < Error; end

    # Raised when API endpoint returns the HTTP status code 403.
    class Forbidden < Error; end

    # Raised when API endpoint returns the HTTP status code 404.
    class NotFound < Error; end

    # Raised when API endpoint returns the HTTP status code 405.
    class MethodNotAllowed < Error; end

    # Raised when API endpoint returns the HTTP status code 409.
    class Conflict < Error; end

    # Raised when API endpoint returns the HTTP status code 410.
    class Gone < Error; end

    # Raised when API endpoint returns the HTTP status code 500.
    class InternalServerError < Error; end

    # Raised when API endpoint returns the HTTP status code 429.
    class ExceededRate < Error; end

    # Raised when API endpoint returns the HTTP status code 502.
    class BadGateway < Error; end

    # Raised when API endpoint returns the HTTP status code 503.
    class ServiceUnavailable < Error; end

    # Raised when API endpoint returns the HTTP status code 503.
    class NotSupportedType < Error; end

    # Raised when a file attempted to be sent in a request doesn't exist
    class FileNotFound < Error; end

    # Raised when API endpoint returns error which is not defined in sdk.
    class UnknownError < Error; end
  end
end
