# HelloSign::SubAttachment



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name`<sup>*_required_</sup> | ```String``` |  The name of attachment.  |  |
| `signer_index`<sup>*_required_</sup> | ```Integer``` |  The signer&#39;s unique number, see `signers[%i%][name]` for more details.<br><br>**NOTE**: Only one signer can be assigned per attachment.  |  |
| `instructions` | ```String``` |  The instructions for uploading the attachment.  |  |
| `required` | ```Boolean``` |  Determines if the attachment must be uploaded.  |  [default to false] |

