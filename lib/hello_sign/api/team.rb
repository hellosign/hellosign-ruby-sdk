module HelloSign
  module Api

    #
    # Contains all the api about the Team resource.
    # Take a look at our {https://www.hellosign.com/api/reference#Team team api document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module Team

      #
      # Returns information about your Team as well as a list of its members.
      # If you do not belong to a Team, HelloSign::Error::NotFound will be raised
      #
      # @return [HelloSign::Resource::Team] your current Team
      #
      # @example
      #   team = @client.get_team
      def get_team
        HelloSign::Resource::Team.new get("/team")
      end

      #
      # Creates a new Team and makes you a member. You must not currently belong to a Team to invoke.
      # @option opts [String] name The name of your Team
      #
      # @return [HelloSign::Resource::Team] new created Team
      #
      # @example
      #   team = @client.create_team :name => 'Team America World Police'
      def create_team opts
        HelloSign::Resource::Team.new post("/team/create", :body => opts)
      end

      #
      # Updates the name of your Team.
      # @option opts [String] name The name of your Team
      #
      # @return [HelloSign::Resource::Team] a Team object
      #
      # @example
      #   team = @client.update_team :name => 'New Team Name'
      def update_team opts
        HelloSign::Resource::Team.new post("/team", :body => opts)
      end

      #
      # Deletes your Team. Can only be invoked when you have a Team with only one member (yourself).
      #
      # @example
      #   team = @client.destroy_team
      def destroy_team
        HelloSign::Resource::Team.new post("/team/destroy")
      end

      #
      # Adds or invites a user (specified using the email_address parameter) to your Team.
      # If the user does not currently have a HelloSign Account, a new one will be created for them.
      # If the user currently has a paid subscription, they will not automatically join the Team but instead will be sent an invitation to join.
      # If a user is already a part of another Team, a "team_invite_failed" error will be returned.
      # @option opts [String] account_id The id of the Account of the user to invite to your Team. The account id prevails if both email_address and acccount_id are provided.
      # @option opts [String] email_address The email address of the Account of the user to invite to your Team. The account id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Team] updated Team object
      #
      # @example
      #   team = @client.add_member_to_team :email_address => 'george@hellosign.com'
      def add_member_to_team opts
        HelloSign::Resource::Team.new post("/team/add_member", :body => opts)
      end


      #
      # Removes a user from your Team. If the user had an outstanding invitation to your Team the invitation will be expired.
      # @option opts [String] account_id The id of the Account of the user to invite to your Team. The account id prevails if both email_address and acccount_id are provided.
      # @option opts [String] email_address The email address of the Account of the user to invite to your Team. The account id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Team] updated Team object
      # @example
      #   team = @client.remove_member_from_team :email_address => 'george@hellosign.com'
      def remove_member_from_team opts
        HelloSign::Resource::Team.new post("/team/remove_member", :body => opts)
      end
    end
  end
end
