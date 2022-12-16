def set_expected_response(code, body, content_type = 'application/json')
  Typhoeus.stub(/hellosign.com/) do
    Typhoeus::Response.new(
      :code    => code,
      :headers => ['Content-Type' => content_type],
      :body    => body,
    )
  end
end

def get_fixture_data(file)
  path = __dir__ + "/../test_fixtures/#{file}.json"

  if ! File.exist? path
    raise "Fixture file #{path} not found"
  end

  JSON.parse(File.read(path), :symbolize_names => true)
end
