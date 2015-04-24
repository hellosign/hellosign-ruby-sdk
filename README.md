# HelloSign Ruby SDK

In addition to this readme, checkout our quickstart guide here:
https://www.hellosign.com/api/gettingStarted#QuickStart

## Installation

Add this line to your application's Gemfile:

    gem 'hellosign-ruby-sdk'

And then execute:

    $ bundle

## Configuration

Create a config block. At a minimum you'll want to set your [API Key](https://www.hellosign.com/home/myAccount/current_tab/integrations#api) but depending on your usage you'll possibly
want to set your app's [Client ID](https://www.hellosign.com/oauth/createAppForm) and [Client Secret](https://www.hellosign.com/oauth/createAppForm). In Rails you can place it in `config/initializers/hello_sign.rb`

```ruby
require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = 'api_key'
  # You can use email_address and password instead of api_key. But api_key is recommended
  # If api_key, email_address and password are all present, api_key will be used
  # config.email_address = 'email_address'
  # config.password = 'password'
end
```

##Usage
When you have configured your app like above, you can start using it:

```ruby
# get your account
my_account = HelloSign.get_account

# get your signature requests
my_signature_requests = HelloSign.get_signature_requests

# view a specific signature request
signature_request = HelloSign.get_signature_requests :signature_request_id => '42383e7327eda33f4b8b91217cbe95408cc1285f'
```

If you need to authenticate for multiple users and you want a separated client for them, you can run:
```ruby
client2 = HelloSign::Client.new :api_key => 'your_user_api_key'
user_account = client2.get_account
```

##Testing

Testing relies on built in hard-coded fixtures. You can run the tests without affecting your actual account data. To do so
from the root of your project run <code>rake spec</code>.

## Additional notes

### Local callbacks
We do not allow app callbacks (event or OAuth) to be set to localhost. However it is still possible to test callbacks against a local server. Tunneling services such as ngrok (http://ngrok.com) can help you set this up.

## License

```
The MIT License (MIT)

Copyright (C) 2014 hellosign.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
