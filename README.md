# HelloSign

## Installation

Add this line to your application's Gemfile:

    gem 'hellosign-ruby-sdk'

And then execute:

    $ bundle

Create a config file. In Rails you can place it in `config/initializers/hello_sign.rb`

```ruby
require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = 'api_key'
  # You can use email_address and password instead of api_key. But api_key is recommended
  # If api_key, email_address and password all present, api_key will be used
  # config.email_address = 'email_address'
  # config.password = 'password'
  config.client_id = 'your_cliend_id' #required only when you want to use embedded or OAuth
  config.client_secret = 'your_cliend_secret' #required only when you want to use OAuth
end
```
##Usage and Documentation
When you have configured your app like above, you can start using it:

```ruby
# get your account
my_account = HelloSign.get_account

# get your signature requests
my_signature_requests = HelloSign.get_signature_requests

# view a specific signature request
signature_request = HelloSign.get_signature_requests :signature_request_id => 'id'
```

If you need to authenticate for multiple users and you want a separated client for them, you can run:
```ruby
client2 = HelloSign::Client.new :api_key => 'your_user_api_key'
user_account = client2.get_account
```

##OAuth
First, you must ensure the client_id and client_secret are defined and match the information from when you created your 'app' on HelloSign. Also - be aware that until your app is approved you will only be able to authorize your own account. Next, generate a link for your users to grant authorization to perform actions on their behalf.
```ruby
# The state param is use for security, it is recommended to use a random and unique string for each user
state = 'random-string'
url = HelloSign.oauth_url state
```
When your user go to that link, if they accept, HelloSign will post to your app OAuth callback url with the same state value and a code param
You need to call
```ruby
oauth_info = HelloSign.get_oauth_token :state => state, :code => 'HelloSign return code'
```

Now you have user token, create a new Client and perform action on their behalf:
```ruby
client = HelloSign::Client.new :auth_token => oauth_info["access_token"]
account = client.get_account
```
Check out the doc [OAuth](https://www.hellosign.com/api/oauthWalkthrough) for more information
