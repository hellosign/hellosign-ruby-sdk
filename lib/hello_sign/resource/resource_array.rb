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
  module Resource
    # Stores an array of HelloSign BaseResource with paging information
    #
    # @author [hellosign]

    class ResourceArray < Array
      attr_reader :page, :num_pages, :num_results, :page_size, :warnings, :headers, :list_info, :data

      # Creates a new ResourceArray from a hash
      #
      # @param hash [Hash] Data of the array.
      # @param key [String] Key of the hash, point to where resource array data is.
      # @param resource_class [Class] a ResourceClass object inherited from BaseResource. Uses the created array item from hash[key].
      #
      # @return [HelloSign::Resource::ResourceArray] a ResourceArray
      def initialize(hash, key, resource_class)
        @headers = hash[:headers]
        @data = hash[:body]
        @list_info = hash[:body]['list_info']
        @page = @list_info['page']
        @num_pages = @list_info['num_pages']
        @num_results = @list_info['num_results']
        @page_size = @list_info['page_size']
        @warnings = hash[:body]['warnings'] ? hash[:body]['warnings'] : nil
        self << resource_class.new(hash[:body], nil)

        hash[key] && hash[key].each do |resource|
          self << resource_class.new(resource, nil)
        end
      end
    end
  end
end
