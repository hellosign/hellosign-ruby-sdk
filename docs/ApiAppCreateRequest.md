# HelloSign::ApiAppCreateRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `domains`<sup>*_required_</sup> | ```Array<String>``` |  The domain names the ApiApp will be associated with.  |  |
| `name`<sup>*_required_</sup> | ```String``` |  The name you want to assign to the ApiApp.  |  |
| `callback_url` | ```String``` |  The URL at which the ApiApp should receive event callbacks.  |  |
| `custom_logo_file` | ```File``` |  An image file to use as a custom logo in embedded contexts. (Only applies to some API plans)  |  |
| `oauth` | [```SubOAuth```](SubOAuth.md) |    |  |
| `options` | [```SubOptions```](SubOptions.md) |    |  |
| `white_labeling_options` | [```SubWhiteLabelingOptions```](SubWhiteLabelingOptions.md) |    |  |

