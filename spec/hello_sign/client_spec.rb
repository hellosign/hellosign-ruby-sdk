require 'spec_helper'

describe HelloSign::Client do
  describe "#initialize" do
    context "with default values" do
      subject(:client){HelloSign::Client.new}
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(HelloSign.send(key))
        end
      end
    end

    context "with custom values" do
      let(:custom_client){
        {
          :email_address => "email_address",
          :password => "password",
          :api_key => "api_key",
          :user_agent => "user_agent",
          :end_point => "end_point",
          :oauth_end_point => "oauth_end_point",
          :api_version => "api_version",
          :client_id => "client_id",
          :client_secret => "client_secret",
          :auth_token => "auth_token",
          :log_level => 5,
          :logging => false
        }
      }
      subject(:client){ HelloSign::Client.new custom_client}
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(custom_client[key])
        end
      end
    end
  end

  describe "#request" do
    context "when response status >= 400" do
      HelloSign::Client::ERRORS.keys.each do |key|
        it "raise #{HelloSign::Client::ERRORS[key].to_s} when response status #{key}" do

          # raise when post
          stub_post("/account/create", 'error', key)
          expect {
            HelloSign.create_account :email_address => "test@example.com", :password => "password"
          }.to raise_error(HelloSign::Client::ERRORS[key])

          # raise when get
          stub_get("/account", 'error', key)
          expect {
            HelloSign.get_account
          }.to raise_error(HelloSign::Client::ERRORS[key])
        end
      end
    end
  end

  describe "prepare" do
    context "signers" do
      describe "is an array" do
        before do
          stub_post("/signature_request/send", 'signature_request')
        end

        it "work correctly" do
          expect(lambda{HelloSign.send_signature_request(
            :files_url => ["http://hellosign.com/test.pdf"],
            :signers => ["sss"]
          )}).not_to raise_error
        end
      end

      describe "is an Hash" do
        before do
          stub_post("/signature_request/send", 'signature_request')
        end

        it "work correctly" do
          expect(lambda{HelloSign.send_signature_request(
            :files_url => ["http://hellosign.com/test.pdf"],
            :signers => [{
              :email_address => 'jack@example.com',
              :name => 'Jack',
              :order => 0
            },{
              :email_address => 'jill@example.com',
              :name => 'Jill',
              :order => 1
            }]
          )}).not_to raise_error
        end
      end
    end

    context "ccs" do
      describe "is an array" do
        before do
          stub_post("/signature_request/send_with_reusable_form", 'signature_request')
        end

        it "work correctly" do
          expect(lambda{HelloSign.send_signature_request_with_reusable_form(
            :ccs => ["sss"]
          )}).not_to raise_error
        end
      end

      describe "is an Hash" do
        before do
          stub_post("/signature_request/send_with_reusable_form", 'signature_request')
        end

        it "work correctly" do
          expect(lambda{HelloSign.send_signature_request_with_reusable_form(
            :ccs => [{
              :email_address => 'jack@example.com',
              :name => 'Jack',
              :role => 'Manager'
            },{
              :email_address => 'jill@example.com',
              :name => 'Jill',
              :role => "Client"
            }]
          )}).not_to raise_error
        end
      end
    end
  end
end
