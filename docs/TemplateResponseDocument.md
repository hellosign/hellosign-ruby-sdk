# HelloSign::TemplateResponseDocument

An array describing each document associated with this Template. Includes form field data for each document.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  Name of the associated file.  |  |
| `index` | ```Integer``` |  Document ordering, the lowest index is displayed first and the highest last.  |  |
| `field_groups` | [```Array<TemplateResponseDocumentFieldGroup>```](TemplateResponseDocumentFieldGroup.md) |    |  |
| `form_fields` | [```Array<TemplateResponseDocumentFormField>```](TemplateResponseDocumentFormField.md) |    |  |
| `custom_fields` | [```Array<TemplateResponseDocumentCustomField>```](TemplateResponseDocumentCustomField.md) |    |  |

