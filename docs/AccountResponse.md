# HelloSign::AccountResponse



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | ```String``` |  The ID of the Account  |  |
| `email_address` | ```String``` |  The email address associated with the Account.  |  |
| `is_locked` | ```Boolean``` |  Returns `true` if the user has been locked out of their account by a team admin.  |  |
| `is_paid_hs` | ```Boolean``` |  Returns `true` if the user has a paid Dropbox Sign account.  |  |
| `is_paid_hf` | ```Boolean``` |  Returns `true` if the user has a paid HelloFax account.  |  |
| `quotas` | [```AccountResponseQuotas```](AccountResponseQuotas.md) |    |  |
| `callback_url` | ```String``` |  The URL that Dropbox Sign events will `POST` to.  |  |
| `role_code` | ```String``` |  The membership role for the team.  |  |
| `team_id` | ```String``` |  The id of the team account belongs to.  |  |
| `locale` | ```String``` |  The locale used in this Account. Check out the list of [supported locales](/api/reference/constants/#supported-locales) to learn more about the possible values.  |  |

