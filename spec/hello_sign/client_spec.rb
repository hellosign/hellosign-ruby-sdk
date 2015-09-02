require 'spec_helper'

describe HelloSign::Client do
  describe '#initialize' do
    context 'with default values' do
      subject(:client) { HelloSign::Client.new }
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(HelloSign.send(key))
        end
      end
    end

    context 'with custom values' do
      let(:custom_client){
        {
          :email_address => 'email_address',
          :password => 'password',
          :api_key => 'api_key',
          :user_agent => 'user_agent',
          :end_point => 'end_point',
          :oauth_end_point => 'oauth_end_point',
          :api_version => 'api_version',
          :client_id => 'client_id',
          :client_secret => 'client_secret',
          :auth_token => 'auth_token',
          :log_level => 5,
          :logging => false,
          :proxy_uri => 'proxy_uri',
          :proxy_user => 'proxy_user',
          :proxy_pass => 'proxy_pass'
        }
      }
      subject(:client) { HelloSign::Client.new custom_client }
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(custom_client[key])
        end
      end
    end
  end

  describe '#request' do
    def post_request(key)
      stub_post('/account/create', 'error', key)
      HelloSign.create_account :email_address => 'test@example.com', :password => 'password'
    end

    def get_request(key)
      stub_get('/account', 'error', key)
      HelloSign.get_account
    end

    HelloSign::Client::ERRORS.keys.each do |key|
      context "when response status #{key}" do
        it "raise #{HelloSign::Client::ERRORS[key].to_s} on post" do
          expect { post_request(key) }.to raise_error(HelloSign::Client::ERRORS[key])
        end

        it "raise #{HelloSign::Client::ERRORS[key].to_s} on get" do
          expect { get_request(key) }.to raise_error(HelloSign::Client::ERRORS[key])
        end
      end
    end

    context 'when response status not listed' do
      it 'raise UnknownError for post' do
        expect { post_request(504) }.to raise_error(HelloSign::Error::UnknownError)
      end

      it 'raise UnknownError for get' do
        expect { get_request(504) }.to raise_error(HelloSign::Error::UnknownError)
      end
    end
  end

  describe 'prepare' do
    context 'signers' do
      describe 'is an array' do
        before do
          stub_post('/signature_request/send', 'signature_request')
        end

        it 'work correctly' do
          expect(lambda{ HelloSign.send_signature_request(
            :files_url => ['http://hellosign.com/test.pdf'],
            :signers => ['sss']
          ) }).not_to raise_error
        end
      end

      describe 'is an Hash' do
        before do
          stub_post('/signature_request/send', 'signature_request')
        end

        it 'work correctly' do
          expect(lambda{ HelloSign.send_signature_request(
            :files_url => ['http://hellosign.com/test.pdf'],
            :signers => [{
              :email_address => 'jack@example.com',
              :name => 'Jack',
              :order => 0
            }, {
              :email_address => 'jill@example.com',
              :name => 'Jill',
              :order => 1
            }]
          ) }).not_to raise_error
        end
      end
    end

    context 'ccs' do
      describe 'is an array' do
        before do
          stub_post('/signature_request/send_with_template', 'signature_request')
        end

        it 'work correctly' do
          expect(lambda{ HelloSign.send_signature_request_with_template(
            :ccs => ['sss']
          ) }).not_to raise_error
        end
      end

      describe 'is an Hash' do
        before do
          stub_post('/signature_request/send_with_template', 'signature_request')
        end

        it 'work correctly' do
          expect(lambda{ HelloSign.send_signature_request_with_template(
            :ccs => [{
              :email_address => 'jack@example.com',
              :name => 'Jack',
              :role => 'Manager'
            }, {
              :email_address => 'jill@example.com',
              :name => 'Jill',
              :role => 'Client'
            }]
          ) }).not_to raise_error
        end
      end
    end
  end
end
