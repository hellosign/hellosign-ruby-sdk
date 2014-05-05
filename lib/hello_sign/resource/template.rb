module HelloSign
  module Resource

    #
    # Contains information about the templates you and your team have created
    #
    # Take a look at our {https://www.hellosign.com/api/reference#Template Template resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class Template < BaseResource

      #
      # create a new Template from a hash. If a key is defined then template data will be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] template's data
      # @param  key [String] (template) key of the hash, point to where template data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Team] a Team resource
      def initialize(hash, key='template')
        super
      end
    end
  end
end
