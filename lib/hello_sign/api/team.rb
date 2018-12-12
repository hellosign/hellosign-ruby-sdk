# The MIT License (MIT)
#
# Copyright (C) 2014 hellosign.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module HelloSign
  module Api
    # Contains all the API calls for the Team resource.
    # Take a look at our API Documentation on the Team Resource (https://app.hellosign.com/api/reference#Team)
    # for more information about this.
    #
    # @author [hellosign]

    module Team

      # Returns member list and information about your Team.
      # If you do not belong to a Team, HelloSign::Error::NotFound will be raised
      #
      # @return [HelloSign::Resource::Team] Current Team
      #
      # @example
      #   team = @client.get_team
      def get_team
        HelloSign::Resource::Team.new get('/team')
      end

      # Creates a new Team and adds you as a member. You must not currently belong to a Team.
      # @option opts [String] name The name of the Team.
      #
      # @return [HelloSign::Resource::Team] a Team
      #
      # @example
      #   team = @client.create_team name: 'Team America World Police'
      def create_team(opts)
        HelloSign::Resource::Team.new post('/team/create', body: opts)
      end

      # Updates the name of your Team.
      # @option opts [String] name The name of your Team.
      #
      # @return [HelloSign::Resource::Team]
      #
      # @example
      #   team = @client.update_team name: 'New Team Name'
      def update_team(opts)
        HelloSign::Resource::Team.new post('/team', body: opts)
      end

      # Deletes your Team. Can only be invoked with a Team with one member (yourself).
      #
      # @return [HTTP::Status] 200 OK
      #
      # @example
      #   team = @client.destroy_team
      def destroy_team
        post('/team/destroy')
      end

      # Adds or invites a user to the Team.
      # If the user does not currently have a HelloSign Account, a new one will be created for them.
      # If the user currently has a paid subscription, they will be emailed an invitation to join the Team.
      # If a user is already a part of a Team, a "team_invite_failed" error will be returned.
      # @option opts [String] account_id The user's Account ID to invite to the Team.
      # @option opts [String] email_address The user's email address to invite to your Team.
      # Note: The account_id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Team] a Team
      #
      # @example
      #   team = @client.add_member_to_team email_address: 'george@example.com'
      def add_member_to_team(opts)
        HelloSign::Resource::Team.new post('/team/add_member', body: opts)
      end

      # Removes a user from the Team. If the user had an outstanding invitation to your Team, the original invitation will expire.
      # @option opts [String] account_id The user's Account ID to remove from the Team.
      # @option opts [String] email_address The user's email address to remove from your Team.
      # @option opts [String] new_owner_email_address The Account's email address to receive all documents, API Apps (if applicable), and API key from removed account. (optional)
      # Note: The account_id prevails if both email_address and acccount_id are provided.
      #
      # @return [HelloSign::Resource::Team] updated Team
      #
      # @example
      #   team = @client.remove_member_from_team email_address: 'george@example.com'
      def remove_member_from_team(opts)
        HelloSign::Resource::Team.new post('/team/remove_member', body: opts)
      end
    end
  end
end
