# HelloSign::EventCallbackRequestEvent

Basic information about the event that occurred.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `event_time`<sup>*_required_</sup> | ```String``` |  Time the event was created (using Unix time).  |  |
| `event_type`<sup>*_required_</sup> | ```String``` |  Type of callback event that was triggered.  |  |
| `event_hash`<sup>*_required_</sup> | ```String``` |  Generated hash used to verify source of event data.  |  |
| `event_metadata`<sup>*_required_</sup> | [```EventCallbackRequestEventMetadata```](EventCallbackRequestEventMetadata.md) |    |  |

