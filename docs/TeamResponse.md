# HelloSign::TeamResponse

Contains information about your team and its members

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  The name of your Team  |  |
| `accounts` | [```Array<AccountResponse>```](AccountResponse.md) |    |  |
| `invited_accounts` | [```Array<AccountResponse>```](AccountResponse.md) |  A list of all Accounts that have an outstanding invitation to join your Team. Note that this response is a subset of the response parameters found in `GET /account`.  |  |

