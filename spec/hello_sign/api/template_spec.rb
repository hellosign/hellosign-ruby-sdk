require 'spec_helper'

describe HelloSign::Api::Template do
  describe '#get_template' do
    before do
      stub_get('/template/1', 'template')
      @template = HelloSign.get_template :template_id => 1
    end

    it 'should get the correct resource' do
      expect(a_get('/template/1')).to have_been_made
    end

    it 'should return a Template' do
      expect(@template).to be_an HelloSign::Resource::Template
    end
  end

  describe '#get_templates' do
    before do
      stub_get('/template/list', 'templates')
      @template = HelloSign.get_templates({})
    end

    it 'should get the correct resource' do
      expect(a_get('/template/list')).to have_been_made
    end

    it 'should return a ResourceArray' do
      expect(@template).to be_an HelloSign::Resource::ResourceArray
    end

    it 'each of Array is an Template' do
      expect(@template[0]).to be_an HelloSign::Resource::Template
    end
  end

  describe '#add_user_to_template' do
    before do
      stub_post('/template/add_user/1', 'template')
      @template = HelloSign.add_user_to_template :template_id => 1
    end

    it 'should get the correct resource' do
      expect(a_post('/template/add_user/1')).to have_been_made
    end

    it 'should return a Template' do
      expect(@template).to be_an HelloSign::Resource::Template
    end
  end

  describe '#remove_user_from_template' do
    before do
      stub_post('/template/remove_user/1', 'template')
      @template = HelloSign.remove_user_from_template :template_id => 1
    end

    it 'should get the correct resource' do
      expect(a_post('/template/remove_user/1')).to have_been_made
    end

    it 'should return a Template' do
      expect(@template).to be_an HelloSign::Resource::Template
    end
  end
end
