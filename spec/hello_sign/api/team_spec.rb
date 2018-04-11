require 'spec_helper'

describe HelloSign::Api::Team do
  describe '#get_team' do
    before do
      stub_get('/team', 'team')
      @team = HelloSign.get_team
    end

    it 'should get the correct resource' do
      expect(a_get('/team')).to have_been_made
    end

    it 'should return response headers' do
      expect(@team.headers).to_not be_nil
    end

    it 'should return user\'s team' do
      expect(@team).to be_an HelloSign::Resource::Team
    end
  end

  describe '#create_team' do
    before do
      stub_post('/team/create', 'team')
      @team = HelloSign.create_team :name => 'Team HelloSign'
    end

    it 'should get the correct resource' do
      expect(a_post('/team/create')).to have_been_made
    end

    it 'should return response headers' do
      expect(@team.headers).to_not be_nil
    end

    it 'should return information about a created team' do
      expect(@team.name).to eql('Team HelloSign')
    end
  end

  describe '#update_team' do
    before do
      stub_post('/team', 'team')
      @team = HelloSign.update_team :name => 'Team HelloSign'
    end

    it 'should get the correct resource' do
      expect(a_post('/team')).to have_been_made
    end

    it 'should return response headers' do
      expect(@team.headers).to_not be_nil
    end

    it 'should return information about a updated team' do
      expect(@team.name).to eql('Team HelloSign')
    end
  end

  describe '#destroy_team' do
    before do
      stub_post('/team/destroy', 'team')
      @team = HelloSign.destroy_team
    end

    it 'should get the correct resource' do
      expect(a_post('/team/destroy')).to have_been_made
    end
  end

  describe '#add_member_to_team' do
    before do
      stub_post('/team/add_member', 'team')
      @team = HelloSign.add_member_to_team :email_address => 'george@example.com'
    end

    it 'should return response headers' do
      expect(@team.headers).to_not be_nil
    end

    it 'should get the correct resource' do
      expect(a_post('/team/add_member')).to have_been_made
    end
  end

  describe '#remove_member_from_team' do
    before do
      stub_post('/team/remove_member', 'team')
      @team = HelloSign.remove_member_from_team :email_address => 'george@example.com'
    end

    it 'should return response headers' do
      expect(@team.headers).to_not be_nil
    end

    it 'should get the correct resource' do
      expect(a_post('/team/remove_member')).to have_been_made
    end
  end
end
