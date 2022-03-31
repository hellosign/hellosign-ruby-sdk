# HelloSign::TemplateResponseAccount

An array of the Accounts that can use this Template.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | ```String``` |  The id of the Account.  |  |
| `email_address` | ```String``` |  The email address associated with the Account.  |  |
| `is_locked` | ```Boolean``` |  Returns true if the user has been locked out of their account by a team admin.  |  |
| `is_paid_hs` | ```Boolean``` |  Returns true if the user has a paid HelloSign account.  |  |
| `is_paid_hf` | ```Boolean``` |  Returns true if the user has a paid HelloFax account.  |  |
| `quotas` | [```Array<TemplateResponseAccountQuota>```](TemplateResponseAccountQuota.md) |    |  |
