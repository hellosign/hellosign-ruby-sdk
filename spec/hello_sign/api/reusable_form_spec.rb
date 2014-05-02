require 'spec_helper'

describe HelloSign::Api::ReusableForm do
  describe "#get_reusable_form" do
    before do
      stub_get("/reusable_form/1", 'reusable_form')
      @reusable_form = HelloSign.get_reusable_form :reusable_form_id => 1
    end

    it "should get the correct resource" do
      expect(a_get("/reusable_form/1")).to have_been_made
    end

    it "should return a ReusableForm" do
      expect(@reusable_form).to be_an HelloSign::Resource::ReusableForm
    end
  end

  describe "#get_reusable_forms" do
    before do
      stub_get("/reusable_form/list", 'reusable_forms')
      @reusable_form = HelloSign.get_reusable_forms({})
    end

    it "should get the correct resource" do
      expect(a_get("/reusable_form/list")).to have_been_made
    end

    it "should return a ResourceArray" do
      expect(@reusable_form).to be_an HelloSign::Resource::ResourceArray
    end

    it "each of Array is an ReusableForm" do
      expect(@reusable_form[0]).to be_an HelloSign::Resource::ReusableForm
    end
  end

  describe "#add_user_to_reusable_form" do
    before do
      stub_post("/reusable_form/add_user/1", 'reusable_form')
      @reusable_form = HelloSign.add_user_to_reusable_form :reusable_form_id => 1
    end

    it "should get the correct resource" do
      expect(a_post("/reusable_form/add_user/1")).to have_been_made
    end

    it "should return a ReusableForm" do
      expect(@reusable_form).to be_an HelloSign::Resource::ReusableForm
    end
  end

  describe "#remove_user_from_reusable_form" do
    before do
      stub_post("/reusable_form/remove_user/1", 'reusable_form')
      @reusable_form = HelloSign.remove_user_from_reusable_form :reusable_form_id => 1
    end

    it "should get the correct resource" do
      expect(a_post("/reusable_form/remove_user/1")).to have_been_made
    end

    it "should return a ReusableForm" do
      expect(@reusable_form).to be_an HelloSign::Resource::ReusableForm
    end
  end
end
