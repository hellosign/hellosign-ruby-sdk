require 'spec_helper'

describe 'Uploading File' do
  describe 'Create Embedded Signature Request' do
    before { stub_post('/signature_request/create_embedded', 'signature_request') }

    it 'works with simple pdf' do
      expect(HelloSign.create_embedded_signature_request({files: ['spec/fixtures/nda.pdf']}))
    end
  end

  describe 'Create Unclaimed Draft' do
    before { stub_post('/unclaimed_draft/create', 'unclaimed_draft') }

    it 'works with simple pdf' do
      expect(HelloSign.create_unclaimed_draft({files: ['spec/fixtures/nda.pdf']}))
    end
  end
end
