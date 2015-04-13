module HelloSign
  module Resource

    #
    # A group of documents that a user can take ownership of by going to the claim URL
    # Take a look at our {https://www.hellosign.com/api/reference}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class TemplateDraft < BaseResource

      #
      # create a new TemplateDraft from a hash. If a key is defined then template draft data will be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] template draft's data
      # @param  key [String] (template_draft) key of the hash, point to where template draft data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Team] a Team resource
      def initialize(hash, key='template')
        super
      end
    end

  end
end
