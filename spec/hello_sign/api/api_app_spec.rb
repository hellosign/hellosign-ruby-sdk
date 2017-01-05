require 'spec_helper'

describe HelloSign::Api::ApiApp do

  describe '#get_api_app' do
    before do
      stub_get('/api_app/5e365c014bea2e9a05a9d0834f3e7ca4', 'api_app')
      @api_app = HelloSign.get_api_app :client_id => '5e365c014bea2e9a05a9d0834f3e7ca4'
    end

    it 'should get the correct resource' do
      expect(a_get('/api_app/5e365c014bea2e9a05a9d0834f3e7ca4')).to have_been_made
    end

    it 'should return current user account' do
      expect(@api_app).to be_an HelloSign::Resource::ApiApp
    end
  end

  describe '#list_api_apps' do
    before do
      stub_get('/api_app/list', 'api_apps')
      @api_apps = HelloSign.get_api_apps({})
    end

    it 'should get the correct resource' do
      expect(a_get('/api_app/list')).to have_been_made
    end

    it 'should return a Resource Array' do
      expect(@api_apps).to be_an HelloSign::Resource::ResourceArray
    end

    it 'each of Array is an ApiApp' do
      expect(@api_apps[0]).to be_an HelloSign::Resource::ApiApp
    end
  end

  describe '#create_api_app' do
    before do
      stub_post('/api_app', 'api_app')
      @api_app = HelloSign.create_api_app(
        :name => 'Herbert App',
        :domain => 'herbert.com'
      )
    end

    it 'should get the correct resource' do
      expect(a_post('/api_app')).to have_been_made
    end

    it 'should return an ApiApp' do
      expect(@api_app).to be_an HelloSign::Resource::ApiApp
    end
  end

  describe '#update_api_app' do
    before do
      stub_post('/api_app/5e365c014bea2e9a05a9d0834f3e7ca4', 'api_app')
      @api_app = HelloSign.update_api_app(
        :client_id => '5e365c014bea2e9a05a9d0834f3e7ca4',
        :name => 'Herbert App',
        :domain => 'herbert.com'
      )
    end

    it 'should get the correct resource' do
      expect(a_post('/api_app/5e365c014bea2e9a05a9d0834f3e7ca4')).to have_been_made
    end

    it 'should return an ApiApp' do
      expect(@api_app).to be_an HelloSign::Resource::ApiApp
    end
  end

  describe '#delete_api_app' do
    before do
      stub_delete('/api_app/1', 'api_app')
      @api_app = HelloSign.delete_api_app(:client_id => '1')
    end

    it 'should get the correct resource' do
      expect(a_delete('/api_app/1')).to have_been_made
    end
  end

end
