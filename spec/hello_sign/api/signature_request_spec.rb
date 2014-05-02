require 'spec_helper'

describe HelloSign::Api::SignatureRequest do
  describe "#get_signature_request" do
    before do
      stub_get("/signature_request/1", 'signature_request')
      @signature_request = HelloSign.get_signature_request :signature_request_id => 1
    end

    it "should get the correct resource" do
      expect(a_get("/signature_request/1")).to have_been_made
    end

    it "should return a SignatureRequest" do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe "#get_signature_requests" do
    before do
      stub_get("/signature_request/list", 'signature_requests')
      @signature_requests = HelloSign.get_signature_requests({})
    end

    it "should get the correct resource" do
      expect(a_get("/signature_request/list")).to have_been_made
    end

    it "should return a SignatureRequestArray" do
      expect(@signature_requests).to be_an HelloSign::Resource::ResourceArray
    end

    it "each of Array is an SignatureRequest" do
      expect(@signature_requests[0]).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe "#send_signature_request" do
    before do
      stub_post("/signature_request/send", 'signature_request')
      @signature_request = HelloSign.send_signature_request(
        :files_url => ["http://hellosign.com/test.pdf"],
        :signers => ["sss"]
      )
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/send")).to have_been_made
    end

    it "should return a SignatureRequest" do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe "#remind_signature_request" do
    before do
      stub_post("/signature_request/remind/1", 'signature_request')
      @signature_request = HelloSign.remind_signature_request(:signature_request_id => 1)
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/remind/1")).to have_been_made
    end

    it "should return a SignatureRequest" do
      expect(@signature_request).to be_an HelloSign::Resource::SignatureRequest
    end
  end

  describe "#cancel_signature_request" do
    before do
      stub_post("/signature_request/cancel/1", 'signature_request')
      @signature_request = HelloSign.cancel_signature_request(:signature_request_id => 1)
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/cancel/1")).to have_been_made
    end
  end

  describe "#signature_request_files" do
    before do
      stub_get("/signature_request/files/1", 'file')
      @files = HelloSign.signature_request_files(:signature_request_id => 1)
    end

    it "should get the correct resource" do
      expect(a_get("/signature_request/files/1")).to have_been_made
    end
  end

  describe "#signature_request_final_copy" do
    before do
      stub_get("/signature_request/final_copy/1", 'file')
      @files = HelloSign.signature_request_final_copy(:signature_request_id => 1)
    end

    it "should get the correct resource" do
      expect(a_get("/signature_request/final_copy/1")).to have_been_made
    end
  end

  describe "#send_signature_request_with_reusable_form" do
    before do
      stub_post("/signature_request/send_with_reusable_form", 'signature_request')
      @signature_request = HelloSign.send_signature_request_with_reusable_form({})
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/send_with_reusable_form")).to have_been_made
    end
  end

  describe "#create_embedded_signature_request" do
    before do
      stub_post("/signature_request/create_embedded", 'signature_request')
      @signature_request = HelloSign.create_embedded_signature_request({})
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/create_embedded")).to have_been_made
    end
  end

  describe "#create_embedded_signature_request_with_reusable_form" do
    before do
      stub_post("/signature_request/create_embedded_with_reusable_form", 'signature_request')
      @signature_request = HelloSign.create_embedded_signature_request_with_reusable_form({})
    end

    it "should get the correct resource" do
      expect(a_post("/signature_request/create_embedded_with_reusable_form")).to have_been_made
    end
  end
end
