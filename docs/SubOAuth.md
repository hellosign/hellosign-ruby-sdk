# HelloSign::SubOAuth

OAuth related parameters.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `callback_url` | ```String``` |  The callback URL to be used for OAuth flows. (Required if `oauth[scopes]` is provided)  |  |
| `scopes` | ```Array<String>``` |  A list of [OAuth scopes](/api/reference/tag/OAuth) to be granted to the app. (Required if `oauth[callback_url]` is provided).  |  |

