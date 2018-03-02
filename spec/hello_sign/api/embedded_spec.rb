require 'spec_helper'

describe HelloSign::Api::Embedded do
  describe '#get_embedded_sign_url' do
    let(:signature_id) { '50e3542f738adfa7ddd4cbd4c00d2a8ab6e4194b' }
    before do
      stub_get("/embedded/sign_url/#{signature_id}", 'embedded')
      @embedded = HelloSign.get_embedded_sign_url :signature_id => signature_id
    end

    it 'should get the correct resource' do
      expect(a_get("/embedded/sign_url/#{signature_id}")).to have_been_made
    end

    it 'should return response headers' do
      expect(@embedded.headers).to_not be_nil
    end

    it 'should return a UnclaimedDraft' do
      expect(@embedded).to be_an HelloSign::Resource::Embedded
    end
  end
end
