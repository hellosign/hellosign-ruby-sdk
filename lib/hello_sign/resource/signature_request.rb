module HelloSign
  module Resource

    #
    # Contains information regarding documents that need to be signed
    # Take a look at our {https://www.hellosign.com/api/reference#SignatureRequest signature request resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class SignatureRequest < BaseResource

      #
      # create a new SignatureRequest from a hash. If a key is defined then account data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] signature request's data
      # @param  key [String] (signature_request) key of the hash, point to where signature request data is. If nil then the hash itself
      #
      #
      # @return [HelloSign::Resource::SignatureRequest] a SignatureRequest resource
      def initialize(hash, key='signature_request')
        super
      end
    end
  end
end
