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
    # Stores the value of a hash. Use missing_method to create method to access it like an object
    #
    # @author [hellosign]

    class BaseResource

      attr_reader :data, :raw_data, :warnings, :headers

      # Converts hash data recursively into BaseResource.
      #
      # @param  hash [Hash] Data of the resource
      # @param  key [String] (nil) Key of the hash, point to where resource data is. If nil, then the hash itself.
      #
      # @return [HelloSign::Resource::BaseResource] a new BaseResource
      def initialize(hash, key=nil)
        @headers = hash[:headers]
        @raw_data = key ? hash[:body][key] : hash
        if hash[:body]
          @warnings = hash[:body]['warnings'] ? hash[:body]['warnings'] : nil
        end

        @data = @raw_data.inject({}) do |data, (key, value)|
          data[key.to_s] = if value.is_a? Hash
            value = BaseResource.new(value)
          elsif ((value.is_a? Array) && (value[0].is_a? Hash))
            value = value.map {|v| BaseResource.new(v)}
          else
            value
          end
          data
        end
      end

      # Magic method, gives class dynamic methods based on hash keys.
      # If initialized hash has a key which matches the method name, return value of that key.
      # Otherwise, return nil.
      #
      # @param method [Symbol] Method's name
      #
      # @example
      #   resource = BaseResource.new email_address: "me@example.com"
      #   resource.email_address => "me@example.com"
      #   resource.not_in_hash_keys => nil
      def method_missing(method)
        @data.key?(method.to_s) ? @data[method.to_s] : nil
      end
    end
  end
end
