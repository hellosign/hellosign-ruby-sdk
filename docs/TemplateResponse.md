# HelloSign::TemplateResponse

Contains information about the templates you and your team have created.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `template_id` | ```String``` |  The id of the Template.  |  |
| `title` | ```String``` |  The title of the Template. This will also be the default subject of the message sent to signers when using this Template to send a SignatureRequest. This can be overridden when sending the SignatureRequest.  |  |
| `message` | ```String``` |  The default message that will be sent to signers when using this Template to send a SignatureRequest. This can be overridden when sending the SignatureRequest.  |  |
| `updated_at` | ```Integer``` |  Time the template was last updated.  |  |
| `is_embedded` | ```Boolean``` |  `true` if this template was created using an embedded flow, `false` if it was created on our website.  |  |
| `is_creator` | ```Boolean``` |  `true` if you are the owner of this template, `false` if it&#39;s been shared with you by a team member.  |  |
| `can_edit` | ```Boolean``` |  Indicates whether edit rights have been granted to you by the owner (always `true` if that&#39;s you).  |  |
| `is_locked` | ```Boolean``` |  Indicates whether the template is locked. If `true`, then the template was created outside your quota and can only be used in `test_mode`. If `false`, then the template is within your quota and can be used to create signature requests.  |  |
| `metadata` | ```Object``` |  The metadata attached to the template.  |  |
| `signer_roles` | [```Array<TemplateResponseSignerRole>```](TemplateResponseSignerRole.md) |  An array of the designated signer roles that must be specified when sending a SignatureRequest using this Template.  |  |
| `cc_roles` | [```Array<TemplateResponseCCRole>```](TemplateResponseCCRole.md) |  An array of the designated CC roles that must be specified when sending a SignatureRequest using this Template.  |  |
| `documents` | [```Array<TemplateResponseDocument>```](TemplateResponseDocument.md) |  An array describing each document associated with this Template. Includes form field data for each document.  |  |
| `custom_fields` | [```Array<TemplateResponseCustomField>```](TemplateResponseCustomField.md) |  An array of Custom Field objects.  |  |
| `named_form_fields` | [```Array<TemplateResponseNamedFormField>```](TemplateResponseNamedFormField.md) |  Deprecated. Use `form_fields` inside the [documents](https://developers.hellosign.com/api/reference/operation/templateGet/#!c&#x3D;200&amp;path&#x3D;template/documents&amp;t&#x3D;response) array instead.  |  |
| `accounts` | [```Array<TemplateResponseAccount>```](TemplateResponseAccount.md) |  An array of the Accounts that can use this Template.  |  |

