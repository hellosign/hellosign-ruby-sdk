require 'spec_helper'

describe HelloSign::Api::Account do
  describe '#get_oauth_token' do
    context 'when successful request' do
      before do
        stub_post_oauth('/oauth/token', 'token')
        @oauth_info = HelloSign.get_oauth_token :state => 'state', :code => 'code'
      end

      it 'should get the correct resource' do
        expect(a_post_oauth('/oauth/token')).to have_been_made
      end
    end
  end

  describe '#refresh_oauth_token' do
    before do
      stub_post_oauth('/oauth/token', 'token')
      @oauth_info = HelloSign.refresh_oauth_token refresh_token: 'oauth_token'
    end

    it 'should get the correct resource' do
      expect(a_post_oauth('/oauth/token')).to have_been_made
    end
  end
end
