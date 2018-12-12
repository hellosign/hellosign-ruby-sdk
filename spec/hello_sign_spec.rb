require 'spec_helper'

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

describe HelloSign do
  after { HelloSign.reset }

  describe '.client' do
    it 'should be a HelloSign::Client' do
      expect(HelloSign.client).to be_a(HelloSign::Client)
    end
  end

  describe '.configure' do
    HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set #{key}" do
        HelloSign.configure do |config|
          config.send("#{key}=", key)
          expect(HelloSign.send(key)).to eql(key)
        end
      end
    end
  end

  describe '.user_agent=' do
    it 'should set user_agent' do
      HelloSign.user_agent = 'Custom User Agent'
      expect(HelloSign.user_agent).to eql('Custom User Agent')
    end
  end

  describe '.user_agent' do
    it 'should return default user_agent' do
      expect(HelloSign.user_agent).to eql(HelloSign::Configuration::DEFAULT_USER_AGENT)
    end
  end
end
