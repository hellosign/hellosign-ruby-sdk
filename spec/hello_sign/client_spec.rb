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
          :proxy_pass => 'proxy_pass',
          :timeout => 240
        }
      }
      subject(:client) { HelloSign::Client.new custom_client }
      HelloSign::Configuration::VALID_OPTIONS_KEYS.each do |key|
        it "should set #{key}" do
          expect(client.send(key)).to eql(custom_client[key])
        end
      end

      it "should create a new HelloSign Client" do
        expect(client).to be_an_instance_of(HelloSign::Client)
      end

      it "should have 'timeout' as a parameter" do
        expect(client.timeout).to eq(240)
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

    describe 'error keys are set' do
      let(:error) do
        begin
          get_request(400)
        rescue => e
          e
        else
          # Defense exception:
          raise 'Expected stub to throw exception'
        end
      end

      describe 'message' do
        subject  { error.message }
        # Following test proves backwards compatibility
        it { is_expected.to match(/Server responded.*/) }
      end

      describe 'response_body' do
        subject { error.response_body }
        it { is_expected.to eql(load_fixture('error').read) }
      end

      describe 'response_status' do
        subject { error.response_status }
        it { is_expected.to eql(400) }
      end

      describe 'request_uri' do
        subject { error.request_uri }
        it { is_expected.to eql('https://api.hellosign.com/v3/account') }
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
