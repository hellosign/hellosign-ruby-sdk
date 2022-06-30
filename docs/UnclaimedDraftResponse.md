# HelloSign::UnclaimedDraftResponse

A group of documents that a user can take ownership of via the claim URL.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_request_id` | ```String``` |  The ID of the signature request that is represented by this UnclaimedDraft.  |  |
| `claim_url` | ```String``` |  The URL to be used to claim this UnclaimedDraft.  |  |
| `signing_redirect_url` | ```String``` |  The URL you want signers redirected to after they successfully sign.  |  |
| `requesting_redirect_url` | ```String``` |  The URL you want signers redirected to after they successfully request a signature (Will only be returned in the response if it is applicable to the request.).  |  |
| `expires_at` | ```Integer``` |  When the link expires.  |  |
| `test_mode` | ```Boolean``` |  Whether this is a test draft. Signature requests made from test drafts have no legal value.  |  |

