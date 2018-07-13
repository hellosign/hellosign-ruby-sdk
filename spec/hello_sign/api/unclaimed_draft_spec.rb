require 'spec_helper'

describe HelloSign::Api::UnclaimedDraft do
  describe '#create_unclaimed_draft' do
    context 'send_document' do
      before do
        stub_post('/unclaimed_draft/create', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_unclaimed_draft({ :type => 'send_document' })
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end

    context 'request_signature' do
      before do
        stub_post('/unclaimed_draft/create', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_unclaimed_draft({ :type => 'request_signature' })
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end

    context 'edit_and_resend' do
      before do
        stub_post('/unclaimed_draft/edit_and_resend/1', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.edit_and_resend_unclaimed_draft(
          :signature_request_id => '1',
          :client_id => '5e365c014bea2e9a05a9d0834f3e7ca4'
        )
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/edit_and_resend/1')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return an UnclaimedDraft response' do
        expect(@unclaimed_draft).to be_a HelloSign::Resource::UnclaimedDraft
      end
    end
  end

  describe '#create_embedded_unclaimed_draft' do
    context 'send_document' do
      before do
        stub_post('/unclaimed_draft/create_embedded', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_embedded_unclaimed_draft({ :type => 'send_document' })
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create_embedded')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end

    context 'request_signature' do
      before do
        stub_post('/unclaimed_draft/create_embedded', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_embedded_unclaimed_draft({ :type => 'request_signature' })
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create_embedded')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end
  end

  describe '#create_embedded_unclaimed_draft_with_template' do
    context 'send_document' do
      before do
        stub_post('/unclaimed_draft/create_embedded_with_template', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_embedded_unclaimed_draft_with_template({})
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create_embedded_with_template')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end

    context 'request_signature' do
      before do
        stub_post('/unclaimed_draft/create_embedded_with_template', 'unclaimed_draft')
        @unclaimed_draft = HelloSign.create_embedded_unclaimed_draft_with_template({})
      end

      it 'should get the correct resource' do
        expect(a_post('/unclaimed_draft/create_embedded_with_template')).to have_been_made
      end

      it 'should return response headers' do
        expect(@unclaimed_draft.headers).to_not be_nil
      end

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end
  end
end
