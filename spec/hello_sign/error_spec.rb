require 'spec_helper'

describe HelloSign::Error do
  # another test to prove backwards compatibility
  describe 'custom error message' do
    subject { HelloSign::Error::Error.new('Foo').message }
    it { is_expected.to eql('Foo') }
  end
end

