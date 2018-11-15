require 'spec_helper'

describe HelloSign::Api::Account do
  describe '#get_account' do
    before do
      stub_get('/account', 'account')
      @account = HelloSign.get_account
    end

    it 'should get the correct resource' do
      expect(a_get('/account')).to have_been_made
    end

    it 'should have response headers' do
      expect(@account.headers).to_not be_nil
    end

    it 'should return current user account' do
      expect(@account).to be_an HelloSign::Resource::Account
    end
  end

  describe '#create_account' do
    before do
      stub_post('/account/create', 'account')
      @body = { email_address: 'test@example.com' }
      @account = HelloSign.create_account @body
    end

    it 'should get the correct resource' do
      expect(a_post('/account/create')).to have_been_made
    end

    it 'should return response headers' do
      expect(@account.headers).to_not be_nil
    end

    it 'should return information about a created account' do
      expect(@account.email_address).to eql('test@example.com')
    end
  end
end
