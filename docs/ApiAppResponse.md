# HelloSign::ApiAppResponse

Contains information about an API App.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `callback_url` | ```String``` |  The app&#39;s callback URL (for events)  |  |
| `client_id` | ```String``` |  The app&#39;s client id  |  |
| `created_at` | ```Integer``` |  The time that the app was created  |  |
| `domains` | ```Array<String>``` |  The domain name(s) associated with the app  |  |
| `name` | ```String``` |  The name of the app  |  |
| `is_approved` | ```Boolean``` |  Boolean to indicate if the app has been approved  |  |
| `oauth` | [```ApiAppResponseOAuth```](ApiAppResponseOAuth.md) |    |  |
| `options` | [```ApiAppResponseOptions```](ApiAppResponseOptions.md) |    |  |
| `owner_account` | [```ApiAppResponseOwnerAccount```](ApiAppResponseOwnerAccount.md) |    |  |
| `white_labeling_options` | [```ApiAppResponseWhiteLabelingOptions```](ApiAppResponseWhiteLabelingOptions.md) |    |  |

