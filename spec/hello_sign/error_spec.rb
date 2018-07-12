require 'spec_helper'

describe HelloSign::Error do
  # another test to prove backwards compatibility
  it 'raises an error with any message' do
    error = HelloSign::Error::Error.new(404, 'test error message', 'http://www.test.com')
    expect(error).to be_instance_of(HelloSign::Error::Error)
  end

end
