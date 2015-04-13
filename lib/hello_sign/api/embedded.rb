module HelloSign
  module Api

    #
    # HelloSign allows you to embed the signing page on your site in an iFrame
    # without the need for the end-user to create a HelloSign account.
    # Take a look at our {https://www.hellosign.com/api/embeddedSigningWalkthrough embedded signing walkthrough}
    # for more information about this.
    #
    # @author [hellosign]
    #
    module Embedded

      #
      # Retrieves the embedded signature request url.
      # @option opts [String] signature_id The id of the signature to get a signature url for
      #
      # @return [HelloSign::Resource::Embedded] Returns an Embedded object
      # @example
      #   embedded = @client.get_embedded_sign_url :signature_id => '50e3542f738adfa7ddd4cbd4c00d2a8ab6e4194b'
      #
      def get_embedded_sign_url(opts)
        HelloSign::Resource::Embedded.new get("/embedded/sign_url/#{opts[:signature_id]}")
      end
      #
      # Retrieves the edit url for an embedded template.
      # @option opts [String] template_id The id of the template to get a edit url for
      #
      # @return [HelloSign::Resource::Embedded] Returns an Embedded object
      # @example
      #   edit_url = @client.get_embedded_template_edit_url :template_id => '39e3387f738adfa7ddd4cbd4c00d2a8ab6e4194b'
      #
      def get_embedded_template_edit_url(opts)
        HelloSign::Resource::Embedded.new get("/embedded/edit_url/#{opts[:template_id]}")
      end
    end
  end
end
