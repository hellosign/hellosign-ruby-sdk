# HelloSign::SignatureRequestResponseSignatures

An array of signature obects, 1 for each signer.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `signature_id` | ```String``` |  Signature identifier.  |  |
| `signer_email_address` | ```String``` |  The email address of the signer.  |  |
| `signer_name` | ```String``` |  The name of the signer.  |  |
| `signer_role` | ```String``` |  The role of the signer.  |  |
| `order` | ```Integer``` |  If signer order is assigned this is the 0-based index for this signer.  |  |
| `status_code` | ```String``` |  The current status of the signature. eg: awaiting_signature, signed, declined.  |  |
| `decline_reason` | ```String``` |  The reason provided by the signer for declining the request.  |  |
| `signed_at` | ```Integer``` |  Time that the document was signed or null.  |  |
| `last_viewed_at` | ```Integer``` |  The time that the document was last viewed by this signer or null.  |  |
| `last_reminded_at` | ```Integer``` |  The time the last reminder email was sent to the signer or null.  |  |
| `has_pin` | ```Boolean``` |  Boolean to indicate whether this signature requires a PIN to access.  |  |
| `has_sms_auth` | ```Boolean``` |  Boolean to indicate whether this signature has SMS authentication enabled.  |  |
| `reassigned_by` | ```String``` |  Email address of original signer who reassigned to this signer.  |  |
| `reassignment_reason` | ```String``` |  Reason provided by original signer who reassigned to this signer.  |  |
| `error` | ```String``` |  Error message pertaining to this signer, or null.  |  |

