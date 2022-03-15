# HelloSign::SubSigningOptions

This allows the requester to specify the types allowed for creating a signature.

**Note**: If `signing_options` are not defined in the request, the allowed types will default to those specified in the account settings.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `default_type`<sup>*_required_</sup> | ```String``` |  The default type shown (limited to the listed types)  |  |
| `draw` | ```Boolean``` |  Allows drawing the signature  |  [default to false] |
| `phone` | ```Boolean``` |  Allows using a smartphone to email the signature  |  [default to false] |
| `type` | ```Boolean``` |  Allows typing the signature  |  [default to false] |
| `upload` | ```Boolean``` |  Allows uploading the signature  |  [default to false] |

