# HelloSign::SubSignatureRequestSigner



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name`<sup>*_required_</sup> | ```String``` |  The name of the signer.  |  |
| `email_address`<sup>*_required_</sup> | ```String``` |  The email address of the signer.  |  |
| `group` | ```String``` |  Name of group. Use this value across multiple signers to group them together. Any of the signers is eligible to sign for the entire group.<br><br>Grouped signers will not use the `order`, `pin`, or `sms_phone_number` fields.  |  |
| `order` | ```Integer``` |  The order the signer is required to sign in.  |  |
| `pin` | ```String``` |  The 4- to 12-character access code that will secure this signer&#39;s signature page.  |  |
| `sms_phone_number` | ```String``` |  An E.164 formatted phone number that will receive a code via SMS to access this signer&#39;s signature page.<br><br>**Note**: Not available in test mode and requires a Platinum plan or higher.  |  |

