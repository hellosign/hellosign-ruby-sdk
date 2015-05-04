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
  module Resource

    #
    # Contains information about an account and its settings.
    # Take a look at our {https://www.hellosign.com/api/reference#Account account resource document}
    # for more information about this.
    #
    # @author [hellosign]
    #
    class Account < BaseResource

      #
      # Create a new Account from a hash. If key defined then account data with be the value of hash[key], otherwise the hash itself
      # @param  hash [Hash] account's data
      # @param  key [String] (account) key of the hash, point to where account data is. If nil then the hash itself
      #
      # @return [HelloSign::Resource:Account] a Account resource
      def initialize(hash, key='account')
        super
      end
    end
  end
end
