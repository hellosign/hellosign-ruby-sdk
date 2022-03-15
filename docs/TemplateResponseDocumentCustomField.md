# HelloSign::TemplateResponseDocumentCustomField

An array of the designated CC roles that must be specified when sending a SignatureRequest using this Template.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  The name of the Custom Field.  |  |
| `type` | ```String``` |  The type of this Custom Field. Only `text` and `checkbox` are currently supported.  |  |
| `x` | ```Integer``` |  The horizontal offset in pixels for this form field.  |  |
| `y` | ```Integer``` |  The vertical offset in pixels for this form field.  |  |
| `width` | ```Integer``` |  The width in pixels of this form field.  |  |
| `height` | ```Integer``` |  The height in pixels of this form field.  |  |
| `required` | ```Boolean``` |  Boolean showing whether or not this field is required.  |  |
| `group` | ```String``` |  The name of the group this field is in. If this field is not a group, this defaults to `null`.  |  |
| `avg_text_length` | [```TemplateResponseDocumentCustomFieldAvgTextLength```](TemplateResponseDocumentCustomFieldAvgTextLength.md) |    |  |
| `named_form_fields` | ```Object``` |  Use `form_fields` under the `documents` array instead.  |  |
| `reusable_form_id` | ```String``` |    |  |

