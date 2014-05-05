module HelloSign
  module Resource

    #
    # An object that contains necessary information to set up embedded signing.
    # Take a look at our {https://www.hellosign.com/api/reference#Embedded account resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class Embedded < BaseResource

      #
      # create a new Embedded resource from a hash. If a key is defined then embedded data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] embedded's data
      # @param  key [String] (embedded) key of the hash, point to where embedded data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Embedded] a Embedded resource
      def initialize(hash, key='embedded')
        super
      end
    end
  end
end
