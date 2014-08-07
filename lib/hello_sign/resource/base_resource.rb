module HelloSign
  module Resource

    #
    # Store the value of a hash. Use missing_method to create method to access it like an object
    #
    # @author [hellosign]
    #
    class BaseResource

      #
      # recursively convert hash data into BaseResource.
      #
      # @param  hash [Hash] data of the resource
      # @param  key [String] (nil) key of the hash, point to where resource data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource::BaseResource] a new BaseResource
      def initialize(hash, key=nil)
        @raw_data = key ? hash[key] : hash
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


      #
      # Magic method, give class dynamic methods based on hash keys.
      #
      # If initialized hash has a key which matches the method name, return value of that key.
      #
      # Otherwise, return nil
      #
      # @param method [Symbol] Method's name
      #
      # @example
      #   resource  = BaseResource.new :email_address => "me@example.com"
      #   resource.email_address # =>  "me@example.com"
      #   resource.not_in_hash_keys # => nil
      def method_missing(method)
        @data.key?(method.to_s) ? @data[method.to_s] : nil
      end

      #
      # raw response data from the server in json
      #
      # @return [type] [description]
      def data
        @raw_data
      end
    end
  end
end
