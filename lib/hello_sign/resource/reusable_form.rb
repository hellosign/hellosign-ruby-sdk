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
      # create a new ReusableForm from a hash. if key define then reuable form data with be the value of hash[key], otherwise a hash ifself
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
