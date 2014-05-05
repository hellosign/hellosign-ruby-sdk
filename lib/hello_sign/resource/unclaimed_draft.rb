module HelloSign
  module Resource

    #
    # A group of documents that a user can take ownership of by going to the claim URL
    # Take a look at our {https://www.hellosign.com/api/reference#UnclaimedDraft unclaimed draft resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class UnclaimedDraft < BaseResource

      #
      # create a new UnclaimedDraft from a hash. If a key is defined then unclaimed draft data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] unclaimed draft's data
      # @param  key [String] (unclaimed_draft) key of the hash, point to where unclaimed draft data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Team] a Team resource
      def initialize(hash, key='unclaimed_draft')
        super
      end
    end
  end
end
