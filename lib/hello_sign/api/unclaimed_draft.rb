module HelloSign
  module Api

    #
    # Contains all the api calls for the UnclaimedDraft resource.
    # Take a look at our {https://www.hellosign.com/api/reference#UnclaimedDraft unclaimed draft document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module UnclaimedDraft

      #
      # Creates a new Draft that can be claimed using the claim URL.
      # The first authenticated user to access the URL will claim the Draft and will be shown either the "Sign and send" or the "Request signature" page with the Draft loaded.
      # Subsequent access to the claim URL will result in a 404 not found.
      # If the type is "send_document" then only the file parameter is required.
      # If the type is "request_signature", then the identities of the signers and optionally
      # the location of signing elements on the page are also required.
      # @option opts [Integer] test_mode (0) Whether this is a test, the signature request will not be legally binding if set to 1.
      # @option opts [Array<String>] files Use files to indicate the uploaded file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [Array<String>] file_urls Use file_urls to have HelloSign download the file(s) to send for signature. Currently we only support use of either the files parameter or file_urls parameter, not both.
      # @option opts [String] type The type of unclaimed draft to create. Use "send_document" to create a claimable file, and "request_signature" for a claimable signature request. If the type is "request_signature" then signers name and email_address are not optional.
      # @option opts [String] subject The subject in the email that will be sent to the signers.
      # @option opts [String] message The custom message in the email that will be sent to the signers.
      # @option opts [String] signing_redirect_url The URL you want the signer redirected to after they successfully sign. (optional)
      #
      # @option opts [Array<Hash>] signers List of signers, each item is a Hash with these keys:
      #   * :name (String) Sender' name
      #   * :email_address (String) Sender's email address
      #   * :order (Integer) The order the signer is required to sign in (optional)
      #   * :pin (Integer) The 4-digit code that will secure this signer's signature page. You must have a business plan to use this feature. (optional)
      # @option opts [Array<String>] cc_email_addresses The email addresses that should be CCed.
      # @option opts [String] form_fields_per_document
      #
      # @return [HelloSign::Resource::UnclaimedDraft] a UnclaimedDraft object
      #
      # @example send_document
      #   unclaimed_draft = @client.create_unclaimed_draft(
      #     :test_mode => 1,
      #     :files => ['NDA.pdf', 'AppendixA.pdf']
      #   )
      # @example request_signature
      #   unclaimed_draft = @client.create_unclaimed_draft(
      #     :test_mode => 1,
      #     :type => 'request_signature',
      #     :subject => 'The NDA we talked about',
      #     :message => 'Please sign this NDA and then we can discuss more. Let me know if you have any questions.',
      #     :signers => [{
      #         :email_address => 'jack@example.com',
      #         :name => 'Jack',
      #         :order => 0
      #       },{
      #         :email_address => 'jill@example.com',
      #         :name => 'Jill',
      #         :order => 1
      #       }
      #     ],
      #     :cc_email_addresses => ['lawyer@hellosign.com', 'lawyer@example.com'],
      #     :files => ['NDA.pdf', 'AppendixA.pdf']
      #   )
      #
      def create_unclaimed_draft opts
        prepare_files opts
        if opts[:type] == 'request_signature'
          prepare_signers opts
        end

        HelloSign::Resource::UnclaimedDraft.new post('/unclaimed_draft/create', :body => opts)
      end
    end
  end
end
