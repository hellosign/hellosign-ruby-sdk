require 'spec_helper'

describe HelloSign do
  after { HelloSign.reset }

  describe ".client" do
    it "should be a HelloSign::Client" do
      expect(HelloSign.client).to be_a(HelloSign::Client)
    end
  end

  describe ".configure" do
    HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set #{key}" do
        HelloSign.configure do |config|
          config.send("#{key}=", key)
          expect(HelloSign.send(key)).to eql(key)
        end
      end
    end
  end

  describe ".user_agent=" do
    it "should set user_agent" do
      HelloSign.user_agent = 'Custom User Agent'
      expect(HelloSign.user_agent).to eql('Custom User Agent')
    end
  end

  describe ".user_agent" do
    it "should return default user_agent" do
      expect(HelloSign.user_agent).to eql(HelloSign::Configuration::DEFAULT_USER_AGENT)
    end
  end
end
