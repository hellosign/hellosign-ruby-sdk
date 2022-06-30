# HelloSign::TemplateResponseDocument



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  Name of the associated file.  |  |
| `index` | ```Integer``` |  Document ordering, the lowest index is displayed first and the highest last (0-based indexing).  |  |
| `field_groups` | [```Array<TemplateResponseDocumentFieldGroup>```](TemplateResponseDocumentFieldGroup.md) |  An array of Form Field Group objects.  |  |
| `form_fields` | [```Array<TemplateResponseDocumentFormField>```](TemplateResponseDocumentFormField.md) |  An array of Form Field objects containing the name and type of each named textbox and checkmark field.  |  |
| `custom_fields` | [```Array<TemplateResponseDocumentCustomField>```](TemplateResponseDocumentCustomField.md) |  An array of Document Custom Field objects.  |  |
| `static_fields` | [```Array<TemplateResponseDocumentStaticField>```](TemplateResponseDocumentStaticField.md) |  An array describing static overlay fields. &lt;b&gt;Note&lt;/b&gt; only available for certain subscriptions.  |  |

