#
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
#

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
      # @option opts [Integer] skip_signer_roles Whether editing signer roles should be skipped
      # @option opts [Integer] skip_subject_message Whether editing subject/message should be skipped
      #
      # @return [HelloSign::Resource::Embedded] Returns an Embedded object
      # @example
      #   edit_url = @client.get_embedded_template_edit_url :template_id => '39e3387f738adfa7ddd4cbd4c00d2a8ab6e4194b'
      #
      def get_embedded_template_edit_url(opts)
        defaults = { :skip_signer_roles => 0, :skip_subject_message => 0 }
        opts = defaults.merge(opts)

        HelloSign::Resource::Embedded.new get("/embedded/edit_url/#{opts[:template_id]}?skip_signer_roles=#{opts[:skip_signer_roles]}&skip_subject_message=#{opts[:skip_subject_message]}")
      end
    end
  end
end
