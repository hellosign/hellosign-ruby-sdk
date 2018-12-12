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
    # Contains all the API calls for Embedded SignatureRequests.
    # Take a look at our Embedded Signing Walkthrough (https://app.hellosign.com/api/embeddedSigningWalkthrough)
    # for more information about this.
    #
    # @author [hellosign]

    module Embedded

      # Retrieves the sign_url for an Embedded SignatureRequest.
      # @option opts [String] signature_id The Signature ID to retrieve the embedded sign_url for.
      #
      # @return [HelloSign::Resource::Embedded]
      #
      # @example
      #   embedded = @client.get_embedded_sign_url signature_id: '50e3542f738adfa7ddd4cbd4c00d2a8ab6e4194b'
      def get_embedded_sign_url(opts)
        HelloSign::Resource::Embedded.new get("/embedded/sign_url/#{opts[:signature_id]}")
      end

      # Retrieves the edit_url for an Embedded Template.
      # @option opts [Boolean] test_mode Indicates if this is a test SignatureRequest, it will not be legally binding if set to 1. Defaults to 0. (optional)
      # @option opts [String] template_id The Template ID to retrieve the embedded edit_url for.
      # @option opts [Array<Hash>] cc_roles The CC roles that must be assigned when using the Embedded Template to create a SignatureRequest. (optional)
      # @option opts [String<Array><Hash>] merge_fields List of fields that can be pre-populated by your application when using the Embedded Template to send a SignatureRequest. (optional)
      #   * name (String) Merge field name
      #   * type (String) Field type - either "text" or "checkbox"
      # @option opts [Boolean] skip_signer_roles Removes the prompt to edit signer roles, if already provided. Defaults to 0. (optional)
      # @option opts [Boolean] skip_subject_message Removes the prompt to edit the subject and message, if already provided. Defaults to 0. (optional)
      #
      # @return [HelloSign::Resource::Embedded]
      #
      # @example
      #   edit_url = @client.get_embedded_template_edit_url template_id: '39e3387f738adfa7ddd4cbd4c00d2a8ab6e4194b'
      def get_embedded_template_edit_url(opts)
        defaults = { skip_signer_roles: 0, skip_subject_message: 0, test_mode: 0 }
        opts = defaults.merge(opts)

        prepare_merge_fields opts

        HelloSign::Resource::Embedded.new post("/embedded/edit_url/#{opts[:template_id]}", body: opts)
      end
    end
  end
end
