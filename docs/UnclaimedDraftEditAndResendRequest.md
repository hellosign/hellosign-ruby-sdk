# HelloSign::UnclaimedDraftEditAndResendRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `client_id`<sup>*_required_</sup> | ```String``` |  Client id of the app used to create the draft. Used to apply the branding and callback url defined for the app.  |  |
| `editor_options` | [```SubEditorOptions```](SubEditorOptions.md) |    |  |
| `is_for_embedded_signing` | ```Boolean``` |  The request created from this draft will also be signable in embedded mode if set to `true`.  |  |
| `requester_email_address` | ```String``` |  The email address of the user that should be designated as the requester of this draft. If not set, original requester&#39;s email address will be used.  |  |
| `requesting_redirect_url` | ```String``` |  The URL you want signers redirected to after they successfully request a signature.  |  |
| `show_progress_stepper` | ```Boolean``` |  When only one step remains in the signature request process and this parameter is set to `false` then the progress stepper will be hidden.  |  [default to true] |
| `signing_redirect_url` | ```String``` |  The URL you want signers redirected to after they successfully sign.  |  |
| `test_mode` | ```Boolean``` |  Whether this is a test, the signature request created from this draft will not be legally binding if set to `true`. Defaults to `false`.  |  [default to false] |

