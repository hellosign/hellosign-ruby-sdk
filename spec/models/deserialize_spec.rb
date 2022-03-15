require 'spec_helper'
require_relative '../test_utils'

config = do_config
api_client = HelloSign::ApiClient.new(config)

describe HelloSign do
  context 'testDeserialize' do

    it 'testSingleFileInstantiated' do
      config.instantiate_files = true
      data = {
        custom_logo_file: 'pdf-sample.pdf',
      }

      result = api_client.convert_to_type(
        data,
        'HelloSign::ApiAppCreateRequest'
      ) || HelloSign::ApiAppCreateRequest.new

      expect(result.custom_logo_file.class.to_s).to eq("File")
    end

    it 'testMultipleFilesInstantiated' do
      config.instantiate_files = true
      data = {
        file: ['pdf-sample.pdf'],
      }

      result = api_client.convert_to_type(
        data,
        'HelloSign::SignatureRequestSendRequest'
      ) || HelloSign::SignatureRequestSendRequest.new

      expect(result.file[0].class.to_s).to eq("File")
    end

    it 'testFilesNotInstantiatedIfFlagNotTrue' do
      config.instantiate_files = false

      data = {
        custom_logo_file: 'pdf-sample.pdf',
      }

      result = api_client.convert_to_type(
        data,
        'HelloSign::ApiAppCreateRequest'
      ) || HelloSign::ApiAppCreateRequest.new

      expect(result.custom_logo_file.class.to_s).to eq("String")
    end
  end
end
