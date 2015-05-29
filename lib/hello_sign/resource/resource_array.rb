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
  module Resource

    #
    # Stores an array of HelloSign BaseResource with paging information
    #
    # @author [hellosign]
    #
    class ResourceArray < Array
      attr_reader :page, :num_pages, :num_results, :page_size

      #
      # create a new ResourceArray from a hash
      #
      # @param  hash [Hash] data of the array
      # @param  key [String] key of the hash, point to where resource array data is
      # @param  resource_class [Class] a Resource Class object inherited from BaseResource. Use the created array item from hash[key]
      #
      # @return [type] [description]
      def initialize(hash, key, resource_class)
        @page = hash['list_info']['page']
        @num_pages = hash['list_info']['num_pages']
        @num_results = hash['list_info']['num_results']
        @page_size = hash['list_info']['page_size']
        @warnings = hash['warnings'] ? hash['warnings'] : nil
        hash[key] && hash[key].each do |resouce|
          self << resource_class.new(resouce, nil)
        end
      end
    end
  end
end
