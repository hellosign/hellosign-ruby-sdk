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

      it 'should return a UnclaimedDraft' do
        expect(@unclaimed_draft).to be_an HelloSign::Resource::UnclaimedDraft
      end
    end
  end
end
