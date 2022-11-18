# HelloSign::TeamApi

All URIs are relative to *https://api.hellosign.com/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [`team_add_member`](TeamApi.md#team_add_member) | **PUT** `/team/add_member` | Add User to Team |
| [`team_create`](TeamApi.md#team_create) | **POST** `/team/create` | Create Team |
| [`team_delete`](TeamApi.md#team_delete) | **DELETE** `/team/destroy` | Delete Team |
| [`team_get`](TeamApi.md#team_get) | **GET** `/team` | Get Team |
| [`team_info`](TeamApi.md#team_info) | **GET** `/team/info` | Get Team Info |
| [`team_invites`](TeamApi.md#team_invites) | **GET** `/team/invites` | List Team Invites |
| [`team_members`](TeamApi.md#team_members) | **GET** `/team/members/{team_id}` | List Team Members |
| [`team_remove_member`](TeamApi.md#team_remove_member) | **POST** `/team/remove_member` | Remove User from Team |
| [`team_sub_teams`](TeamApi.md#team_sub_teams) | **GET** `/team/sub_teams/{team_id}` | List Sub Teams |
| [`team_update`](TeamApi.md#team_update) | **PUT** `/team` | Update Team |


## `team_add_member`

> `<TeamGetResponse> team_add_member(team_add_member_request, opts)`

Add User to Team

Invites a user (specified using the `email_address` parameter) to your Team. If the user does not currently have a Dropbox Sign Account, a new one will be created for them. If a user is already a part of another Team, a `team_invite_failed` error will be returned.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

data = HelloSign::TeamAddMemberRequest.new
data.email_address = "george@example.com"

begin
  result = api.team_add_member(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_add_member_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetResponse>, Integer, Hash)> team_add_member_with_http_info(team_add_member_request, opts)`

```ruby
begin
  # Add User to Team
  data, status_code, headers = api_instance.team_add_member_with_http_info(team_add_member_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_add_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_add_member_request` | [**TeamAddMemberRequest**](TeamAddMemberRequest.md) |  |  |
| `team_id` | **String** | The id of the team. | [optional] |

### Return type

[**TeamGetResponse**](TeamGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `team_create`

> `<TeamGetResponse> team_create(team_create_request)`

Create Team

Creates a new Team and makes you a member. You must not currently belong to a Team to invoke.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

data = HelloSign::TeamCreateRequest.new
data.name = "New Team Name"

begin
  result = api.team_create(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_create_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetResponse>, Integer, Hash)> team_create_with_http_info(team_create_request)`

```ruby
begin
  # Create Team
  data, status_code, headers = api_instance.team_create_with_http_info(team_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_create_request` | [**TeamCreateRequest**](TeamCreateRequest.md) |  |  |

### Return type

[**TeamGetResponse**](TeamGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `team_delete`

> `team_delete`

Delete Team

Deletes your Team. Can only be invoked when you have a Team with only one member (yourself).

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

begin
  result = api.team_delete
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_delete_with_http_info` variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> `<Array(nil, Integer, Hash)> team_delete_with_http_info`

```ruby
begin
  # Delete Team
  data, status_code, headers = api_instance.team_delete_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_delete_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_get`

> `<TeamGetResponse> team_get`

Get Team

Returns information about your Team as well as a list of its members. If you do not belong to a Team, a 404 error with an error_name of \"not_found\" will be returned.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

begin
  result = api.team_get
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_get_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetResponse>, Integer, Hash)> team_get_with_http_info`

```ruby
begin
  # Get Team
  data, status_code, headers = api_instance.team_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**TeamGetResponse**](TeamGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_info`

> `<TeamGetInfoResponse> team_info(opts)`

Get Team Info

Provides information about a team.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

begin
  result = api.team_info
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_info_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetInfoResponse>, Integer, Hash)> team_info_with_http_info(opts)`

```ruby
begin
  # Get Team Info
  data, status_code, headers = api_instance.team_info_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetInfoResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_info_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_id` | **String** | The id of the team. | [optional] |

### Return type

[**TeamGetInfoResponse**](TeamGetInfoResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_invites`

> `<TeamInvitesResponse> team_invites(opts)`

List Team Invites

Provides a list of team invites (and their roles).

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

email_address = "user@hellosign.com"

begin
  result = api.team_invites({email_address: email_address})
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_invites_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamInvitesResponse>, Integer, Hash)> team_invites_with_http_info(opts)`

```ruby
begin
  # List Team Invites
  data, status_code, headers = api_instance.team_invites_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamInvitesResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_invites_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `email_address` | **String** | The email address for which to display the team invites. | [optional] |

### Return type

[**TeamInvitesResponse**](TeamInvitesResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_members`

> `<TeamMembersResponse> team_members(team_id, opts)`

List Team Members

Provides a paginated list of members (and their roles) that belong to a given team.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

team_id = "4fea99bfcf2b26bfccf6cea3e127fb8bb74d8d9c"

begin
  result = api.team_members(team_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_members_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamMembersResponse>, Integer, Hash)> team_members_with_http_info(team_id, opts)`

```ruby
begin
  # List Team Members
  data, status_code, headers = api_instance.team_members_with_http_info(team_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamMembersResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_members_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_id` | **String** | The id of the team that a member list is being requested from. |  |
| `page` | **Integer** | Which page number of the team member list to return. Defaults to `1`. | [optional][default to 1] |
| `page_size` | **Integer** | Number of objects to be returned per page. Must be between `1` and `100`. Default is `20`. | [optional][default to 20] |

### Return type

[**TeamMembersResponse**](TeamMembersResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_remove_member`

> `<TeamGetResponse> team_remove_member(team_remove_member_request)`

Remove User from Team

Removes the provided user Account from your Team. If the Account had an outstanding invitation to your Team, the invitation will be expired. If you choose to transfer documents from the removed Account to an Account provided in the `new_owner_email_address` parameter (available only for Enterprise plans), the response status code will be 201, which indicates that your request has been queued but not fully executed.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

data = HelloSign::TeamRemoveMemberRequest.new
data.email_address = "teammate@hellosign.com"
data.new_owner_email_address = "new_teammate@hellosign.com"

begin
  result = api.team_remove_member(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_remove_member_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetResponse>, Integer, Hash)> team_remove_member_with_http_info(team_remove_member_request)`

```ruby
begin
  # Remove User from Team
  data, status_code, headers = api_instance.team_remove_member_with_http_info(team_remove_member_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_remove_member_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_remove_member_request` | [**TeamRemoveMemberRequest**](TeamRemoveMemberRequest.md) |  |  |

### Return type

[**TeamGetResponse**](TeamGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## `team_sub_teams`

> `<TeamSubTeamsResponse> team_sub_teams(team_id, opts)`

List Sub Teams

Provides a paginated list of sub teams that belong to a given team.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

team_id = "4fea99bfcf2b26bfccf6cea3e127fb8bb74d8d9c"

begin
  result = api.team_sub_teams(team_id)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_sub_teams_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamSubTeamsResponse>, Integer, Hash)> team_sub_teams_with_http_info(team_id, opts)`

```ruby
begin
  # List Sub Teams
  data, status_code, headers = api_instance.team_sub_teams_with_http_info(team_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamSubTeamsResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_sub_teams_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_id` | **String** | The id of the parent Team. |  |
| `page` | **Integer** | Which page number of the SubTeam List to return. Defaults to `1`. | [optional][default to 1] |
| `page_size` | **Integer** | Number of objects to be returned per page. Must be between `1` and `100`. Default is `20`. | [optional][default to 20] |

### Return type

[**TeamSubTeamsResponse**](TeamSubTeamsResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## `team_update`

> `<TeamGetResponse> team_update(team_update_request)`

Update Team

Updates the name of your Team.

### Examples

```ruby
require "hellosign-ruby-sdk"

HelloSign.configure do |config|
  # Configure HTTP basic authorization: api_key
  config.username = "YOUR_API_KEY"

  # or, configure Bearer (JWT) authorization: oauth2
  # config.access_token = "YOUR_ACCESS_TOKEN"
end

api = HelloSign::TeamApi.new

data = HelloSign::TeamUpdateRequest.new
data.name = "New Team Name"

begin
  result = api.team_update(data)
  p result
rescue HelloSign::ApiError => e
  puts "Exception when calling HelloSign API: #{e}"
end

```

#### Using the `team_update_with_http_info` variant

This returns an Array which contains the response data, status code and headers.

> `<Array(<TeamGetResponse>, Integer, Hash)> team_update_with_http_info(team_update_request)`

```ruby
begin
  # Update Team
  data, status_code, headers = api_instance.team_update_with_http_info(team_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TeamGetResponse>
rescue HelloSign::ApiError => e
  puts "Error when calling TeamApi->team_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `team_update_request` | [**TeamUpdateRequest**](TeamUpdateRequest.md) |  |  |

### Return type

[**TeamGetResponse**](TeamGetResponse.md)

### Authorization

[api_key](../README.md#api_key), [oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

