def do_config
  config = HelloSign.configure
  config.instantiate_files = false
  config.root_file_path = __dir__ + "/../test_fixtures"

  config
end

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
  path = "#{HelloSign.configure.root_file_path}/#{file}.json"

  if ! File.exist? path
    raise "Fixture file #{path} not found"
  end

  JSON.parse(File.read(path), :symbolize_names => true)
end
