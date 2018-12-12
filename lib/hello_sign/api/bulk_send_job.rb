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
    # Contains all the API calls for the BulkSendJob resource.
    # Take a look at our API Documentation on BulkSendJobs (https://app.hellosign.com/api/reference#BulkSendJob)
    # for more information about this.
    #
    # @author [hellosign]

    module BulkSendJob

      # Retrieves a BulkSendJob with a given ID
      # @option opts [String] bulk_send_job_id The BulkSendJob ID to retrieve.
      #
      # @return [HelloSign::Resource::BulkSendJob]
      #
      # @example
      #   bulk_send_job = @client.get_bulk_send_job bulk_send_job_id: 'af299494bdcad318b4856aa34aa263dbdaaee9ab'
      def get_bulk_send_job(opts)
        path = "/bulk_send_job/#{opts[:bulk_send_job_id]}"

        HelloSign::Resource::BulkSendJob.new get(path)
      end

      # Returns a list of BulkSendJobs that your Account can access.
      # @option opts [Integer] page Sets the page number of the list to return. Defaults to 1. (optional)
      # @option opts [Integer] page_size Determines the number of BulkSendJobs returned per page. Defaults to 20. (optional)
      #
      # @return [HelloSign::Resource::ResourceArray]
      #
      # @example
      #   bulk_send_jobs = @client.get_bulk_send_jobs page: 1
      def get_bulk_send_jobs(opts={})
        path = '/bulk_send_job/list'
        path += opts[:page] ? "?page=#{opts[:page]}" : ''
        path += opts[:page_size] ? "&page_size=#{opts[:page_size]}" : ''
        HelloSign::Resource::ResourceArray.new get(path, opts), 'bulk_send_jobs', HelloSign::Resource::BulkSendJob
      end
    end
  end
end
