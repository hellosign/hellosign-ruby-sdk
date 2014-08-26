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
        hash[key] && hash[key].each do |resouce|
          self << resource_class.new(resouce, nil)
        end
      end
    end
  end
end
