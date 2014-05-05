module HelloSign
  module Resource

    #
    # Contains information about the templates you and your team have created
    #
    # Take a look at our {https://www.hellosign.com/api/reference#ReusableForm reusableForm resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class ReusableForm < BaseResource

      #
      # create a new ReusableForm from a hash. If a key is defined then reusable form data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] reusable form's data
      # @param  key [String] (reusable_form) key of the hash, point to where reusable form data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Team] a Team resource
      def initialize(hash, key='reusable_form')
        super
      end
    end
  end
end
