require 'spec_helper'
require 'json_spec'
require 'json'
require_relative './test_utils'

config = HelloSign.configure
api_client = HelloSign::ApiClient.new(config)

describe HelloSign::ApiClient do
  fixtures = [
    'AccountCreateRequest',
    'AccountUpdateRequest',
    'AccountVerifyRequest',
    'ApiAppCreateRequest',
    'ApiAppUpdateRequest',
    'EmbeddedEditUrlRequest',
    'OAuthTokenGenerateRequest',
    'OAuthTokenRefreshRequest',
    'ReportCreateRequest',
    'SignatureRequestBulkCreateEmbeddedWithTemplateRequest',
    'SignatureRequestBulkSendWithTemplateRequest',
    'SignatureRequestCreateEmbeddedRequest',
    'SignatureRequestCreateEmbeddedWithTemplateRequest',
    'SignatureRequestRemindRequest',
    'SignatureRequestSendRequest',
    'SignatureRequestSendWithTemplateRequest',
    'SignatureRequestUpdateRequest',
    'TeamAddMemberRequest',
    'TeamCreateRequest',
    'TeamRemoveMemberRequest',
    'TeamUpdateRequest',
    'TemplateAddUserRequest',
    'TemplateCreateEmbeddedDraftRequest',
    'TemplateRemoveUserRequest',
    'TemplateUpdateFilesRequest',
    'UnclaimedDraftCreateEmbeddedRequest',
    'UnclaimedDraftCreateEmbeddedWithTemplateRequest',
    'UnclaimedDraftCreateRequest',
    'UnclaimedDraftEditAndResendRequest',
  ]

  context 'Fixture tests' do
    fixtures.each do |fixture|
      fixture_data = get_fixture_data(fixture)

      fixture_data.each do |key, data|
        it "#{fixture}.#{key}" do
          classname = "HelloSign::#{fixture}"
          obj = api_client.convert_to_type(data, classname)
          serialized = obj.to_hash(false)

          expect(obj.class.to_s).to eq(classname)

          expect(serialized.to_json).to be_json_eql(data.to_json)
        end
      end
    end
  end
end
