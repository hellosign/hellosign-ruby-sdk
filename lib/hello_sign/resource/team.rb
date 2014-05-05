module HelloSign
  module Resource

    #
    # Contains information about an team and its members.
    # Take a look at our {https://www.hellosign.com/api/reference#Team team resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class Team < BaseResource

      #
      # create a new Team from a hash. If a key is defined then team data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] team's data
      # @param  key [String] (team) key of the hash, point to where team data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Team] a Team resource
      def initialize(hash, key='team')
        super
      end
    end
  end
end
