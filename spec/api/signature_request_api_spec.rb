=begin
#HelloSign API

#HelloSign v3 API

The version of the OpenAPI document: 3.0.0
Contact: apisupport@hellosign.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

require 'spec_helper'
require 'json_spec'
require_relative '../test_utils'

config = do_config
api_client = HelloSign::ApiClient.new(config)

describe HelloSign::SignatureRequestApi do
  context 'SignatureRequestApiTest' do
    api = HelloSign::SignatureRequestApi.new

    it 'testSignatureRequestBulkCreateEmbeddedWithTemplate' do
      request_class = 'SignatureRequestBulkCreateEmbeddedWithTemplateRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'BulkSendJobSendResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_bulk_create_embedded_with_template(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestBulkSendWithTemplate' do
      request_class = 'SignatureRequestBulkSendWithTemplateRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'BulkSendJobSendResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_bulk_send_with_template(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    skip 'testSignatureRequestCancel' do
    end

    it 'testSignatureRequestCreateEmbedded' do
      request_class = 'SignatureRequestCreateEmbeddedRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_create_embedded(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestCreateEmbeddedWithTemplate' do
      request_class = 'SignatureRequestCreateEmbeddedWithTemplateRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_create_embedded_with_template(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestFiles' do
      signature_request_id = 'fa5c8a0b0f492d768749333ad6fcc214c111e967'
      file_type = 'pdf'
      get_url = false
      get_data_uri = false

      response_class = 'FileResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)

      result = api.signature_request_files(signature_request_id,{
        :file_type => file_type,
        :get_url => get_url,
        :get_data_uri => get_data_uri,
      })

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestGet' do
      signature_request_id = 'fa5c8a0b0f492d768749333ad6fcc214c111e967'

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)

      result = api.signature_request_get(signature_request_id)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestList' do
      account_id = 'all'

      response_class = 'SignatureRequestListResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)

      result = api.signature_request_list({:account_id => account_id})

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestReleaseHold' do
      signature_request_list = 'fa5c8a0b0f492d768749333ad6fcc214c111e967'

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)

      result = api.signature_request_release_hold(signature_request_list)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestRemind' do
      signature_request_list = 'fa5c8a0b0f492d768749333ad6fcc214c111e967'

      request_class = 'SignatureRequestRemindRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_remind(signature_request_list, obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    skip 'testSignatureRequestRemove' do
    end

    it 'testSignatureRequestSendRequest' do
      request_class = 'SignatureRequestSendRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_send(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testFileForcesMultipartFormData' do
      request_class = 'SignatureRequestSendRequest'
      request_data = get_fixture_data(request_class)[:with_file]

      obj = api_client.convert_to_type(request_data, request_class)

      result = api_client.generate_form_data(
        obj,
        HelloSign::SignatureRequestSendRequest.openapi_types,
      )

      expect(result[:has_file]).to eq(true)
    end

    it 'testNoFileForcesApplicationJson' do
      request_class = 'SignatureRequestSendRequest'
      request_data = get_fixture_data(request_class)[:with_file_url]

      obj = api_client.convert_to_type(request_data, request_class)

      result = api_client.generate_form_data(
        obj,
        HelloSign::SignatureRequestSendRequest.openapi_types,
      )

      expect(result[:has_file]).to eq(false)
    end

    it 'testSignatureRequestSendWithTemplate' do
      request_class = 'SignatureRequestSendWithTemplateRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_send_with_template(obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end

    it 'testSignatureRequestUpdate' do
      signature_request_id = 'fa5c8a0b0f492d768749333ad6fcc214c111e967'

      request_class = 'SignatureRequestUpdateRequest'
      request_data = get_fixture_data(request_class)[:default]

      response_class = 'SignatureRequestGetResponse'
      response_data = get_fixture_data(response_class)[:default]

      set_expected_response(200, JSON.dump(response_data))
      expected = api_client.convert_to_type(response_data, response_class)
      obj = api_client.convert_to_type(request_data, request_class)

      result = api.signature_request_update(signature_request_id, obj)

      expect(result.class.to_s).to eq("HelloSign::#{response_class}")
      expect(result.to_json).to be_json_eql(expected.to_json)
    end
  end
end