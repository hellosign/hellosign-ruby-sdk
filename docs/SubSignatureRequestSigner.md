# HelloSign::SubSignatureRequestSigner



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name`<sup>*_required_</sup> | ```String``` |  The name of the signer.  |  |
| `email_address`<sup>*_required_</sup> | ```String``` |  The email address of the signer.  |  |
| `order` | ```Integer``` |  The order the signer is required to sign in.  |  |
| `pin` | ```String``` |  The 4- to 12-character access code that will secure this signer&#39;s signature page.  |  |
| `sms_phone_number` | ```String``` |  An E.164 formatted phone number.<br><br>**Note**: Not available in test mode and requires a Standard plan or higher.  |  |
| `sms_phone_number_type` | ```String``` |  **Note**: This only works in non embedded endpoints.<br><br>If set, the value must be either `authentication` or `delivery`. Default `authentication`. <br><br>If `authentication` is set, `sms_phone_number` will receive a code via SMS to access this signer&#39;s signature page.<br><br>If `delivery` is set, signature request will be delivered to both email and `sms_phone_number`.  |  |

