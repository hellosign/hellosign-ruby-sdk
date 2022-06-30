# HelloSign::EventCallbackRequestEventMetadata

Specific metadata about the event.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `related_signature_id` | ```String``` |  Signature ID for a specific signer. Applicable to `signature_request_signed` and `signature_request_viewed` events.  |  |
| `reported_for_account_id` | ```String``` |  Account ID the event was reported for.  |  |
| `reported_for_app_id` | ```String``` |  App ID the event was reported for.  |  |
| `event_message` | ```String``` |  Message about a declined or failed (due to error) signature flow.  |  |

