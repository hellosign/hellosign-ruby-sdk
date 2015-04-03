require 'spec_helper'

describe 'Uploading File' do
  describe 'Create Embedded Signature Request' do
    before { stub_post('/signature_request/create_embedded', 'signature_request') }

    it 'works with simple pdf' do
      expect(HelloSign.create_embedded_signature_request({files: [load_file('empty.pdf')]}))
    end

    it 'works with null byte string' do
      expect(HelloSign.create_embedded_signature_request({files: ["\0"]}))
    end

    it 'works with empty string' do
      expect(HelloSign.create_embedded_signature_request({files: ['']}))
    end
  end

  describe 'Create Unclaimed Draft' do
    before { stub_post('/unclaimed_draft/create', 'unclaimed_draft') }

    it 'works with simple pdf' do
      expect(HelloSign.create_unclaimed_draft({files: [load_file('empty.pdf')]}))
    end

    it 'works with null byte string' do
      expect(HelloSign.create_unclaimed_draft({files: ["\0"]}))
    end

    it 'works with empty string' do
      expect(HelloSign.create_unclaimed_draft({files: ['']}))
    end
  end
end