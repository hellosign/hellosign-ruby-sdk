# HelloSign::TemplateResponse



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
| `is_locked` | ```Boolean``` |  `true` if you exceed Template quota; these can only be used in test mode. `false` if the template is included with the Template quota; these can be used at any time.  |  |
| `metadata` | ```Object``` |  The metadata attached to the template.  |  |
| `signer_roles` | [```Array<TemplateResponseSignerRole>```](TemplateResponseSignerRole.md) |    |  |
| `cc_roles` | [```Array<TemplateResponseCCRole>```](TemplateResponseCCRole.md) |    |  |
| `documents` | [```Array<TemplateResponseDocument>```](TemplateResponseDocument.md) |    |  |
| `custom_fields` | [```Array<TemplateResponseCustomField>```](TemplateResponseCustomField.md) |    |  |
| `accounts` | [```Array<TemplateResponseAccount>```](TemplateResponseAccount.md) |    |  |
| `warnings` | [```Array<WarningResponse>```](WarningResponse.md) |    |  |

