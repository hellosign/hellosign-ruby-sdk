require 'spec_helper'

describe HelloSign::Api::SignatureRequest do
  describe '#get_signature_request' do
    before do
      stub_get('/signature_request/1', 'signature_request')
      @signature_request = HelloSign.get_signature_request :signature_request_id => 1
    end

    it 'should get the correct resource' do
      expect(a_get('/signature_request/1')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end

    it 'should return a SignatureRequest' do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe '#get_signature_requests' do
    before do
      stub_get('/signature_request/list', 'signature_requests')
      @signature_requests = HelloSign.get_signature_requests({})
    end

    it 'should get the correct resource' do
      expect(a_get('/signature_request/list')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_requests.headers).to_not be_nil
    end

    it 'should return a SignatureRequestArray' do
      expect(@signature_requests).to be_an HelloSign::Resource::ResourceArray
    end

    it 'each of Array is an SignatureRequest' do
      expect(@signature_requests[0]).to be_an HelloSign::Resource::SignatureRequest
    end

    it 'should return list_info as a BaseResource in results' do
      expect(@signature_requests[0].list_info).to be_an HelloSign::Resource::BaseResource
    end

    it 'should return page numbers as an integer' do
      expect(@signature_requests[0].list_info.page).to be_an Integer
    end
  end

  describe '#send_signature_request' do
    before do
      stub_post('/signature_request/send', 'signature_request')
      @signature_request = HelloSign.send_signature_request(
        :files_url => ['http://hellosign.com/test.pdf'],
        :signers => ['sss']
      )
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/send')).to have_been_made
    end

    it 'should return a SignatureRequest' do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe '#remind_signature_request' do
    before do
      stub_post('/signature_request/remind/1', 'signature_request')
      @signature_request = HelloSign.remind_signature_request(:signature_request_id => 1)
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/remind/1')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end

    it 'should return response warnings' do
      expect(@signature_request.warnings).to_not be_nil
    end

    it 'should return a SignatureRequest' do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe '#cancel_signature_request' do
    before do
      stub_post('/signature_request/cancel/1', 'signature_request')
      @signature_request = HelloSign.cancel_signature_request(:signature_request_id => 1)
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/cancel/1')).to have_been_made
    end
  end

  describe '#remove_signature_request' do
    before do
      stub_post('/signature_request/remove/1', 'signature_request')
      @signature_request = HelloSign.remove_signature_request(:signature_request_id => 1)
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/remove/1')).to have_been_made
    end
  end

  describe '#signature_request_files' do
    before do
      stub_get('/signature_request/files/1', 'file')
      @files = HelloSign.signature_request_files(:signature_request_id => 1)
    end

    it 'should get the correct resource' do
      expect(a_get('/signature_request/files/1')).to have_been_made
    end
  end

  describe '#signature_request_files with options' do
    describe ':get_url' do
      before do
        stub_get('/signature_request/files/1?get_url=true', 'file')
        @files = HelloSign.signature_request_files(:signature_request_id => 1, :get_url => true)
      end

      it 'should get the correct resource' do
        expect(a_get('/signature_request/files/1?get_url=true')).to have_been_made
      end
    end

    describe ':file_type' do
      before do
        stub_get('/signature_request/files/1?file_type=pdf', 'file')
        @files = HelloSign.signature_request_files(:signature_request_id => 1, :file_type => 'pdf')
      end

      it 'should get the correct resource' do
        expect(a_get('/signature_request/files/1?file_type=pdf')).to have_been_made
      end
    end

    describe ':file_type and :get_url' do
      before do
        stub_get('/signature_request/files/1?file_type=pdf&get_url=true', 'file')
        @files = HelloSign.signature_request_files(:signature_request_id => 1, :file_type => 'pdf', :get_url => true)
      end

      it 'should get the correct resource' do
        expect(a_get('/signature_request/files/1?file_type=pdf&get_url=true')).to have_been_made
      end
    end
  end

  describe '#send_signature_request_with_template' do
    before do
      stub_post('/signature_request/send_with_template', 'signature_request')
      @signature_request = HelloSign.send_signature_request_with_template({})
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/send_with_template')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end
  end

  describe '#create_embedded_signature_request' do
    before do
      stub_post('/signature_request/create_embedded', 'signature_request')
      @signature_request = HelloSign.create_embedded_signature_request({})
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/create_embedded')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end
  end

  describe '#create_embedded_signature_request_with_template' do
    before do
      stub_post('/signature_request/create_embedded_with_template', 'signature_request')
      @signature_request = HelloSign.create_embedded_signature_request_with_template({})
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/create_embedded_with_template')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end
  end

  describe '#update_signature_request' do
    before do
      stub_post('/signature_request/update/1', 'signature_request')
      @signature_request = HelloSign.update_signature_request(
        :signature_request_id => '1',
        :signature_id => 'signature_id',
        :email_address => 'updated_signer_email_address@example.com'
        )
    end

    it 'should get the correct resource' do
      expect(a_post('/signature_request/update/1')).to have_been_made
    end

    it 'should return response headers' do
      expect(@signature_request.headers).to_not be_nil
    end

    it 'should return a Signature Request' do
      expect(@signature_request).to be_a HelloSign::Resource::SignatureRequest
    end
  end
end
