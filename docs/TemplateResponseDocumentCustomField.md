# HelloSign::TemplateResponseDocumentCustomField



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  The name of the Custom Field.  |  |
| `type` | ```String``` |  The type of this Custom Field. Only `text` and `checkbox` are currently supported.  |  |
| `signer` | ```String``` |  The signer of the Custom Field.  |  |
| `x` | ```Integer``` |  The horizontal offset in pixels for this form field.  |  |
| `y` | ```Integer``` |  The vertical offset in pixels for this form field.  |  |
| `width` | ```Integer``` |  The width in pixels of this form field.  |  |
| `height` | ```Integer``` |  The height in pixels of this form field.  |  |
| `required` | ```Boolean``` |  Boolean showing whether or not this field is required.  |  |
| `api_id` | ```String``` |  The unique ID for this field.  |  |
| `group` | ```String``` |  The name of the group this field is in. If this field is not a group, this defaults to `null`.  |  |
| `avg_text_length` | [```TemplateResponseFieldAvgTextLength```](TemplateResponseFieldAvgTextLength.md) |    |  |
| `is_multiline` | ```Boolean``` |  Whether this form field is multiline text.  |  |
| `original_font_size` | ```Integer``` |  Original font size used in this form field&#39;s text.  |  |
| `font_family` | ```String``` |  Font family used in this form field&#39;s text.  |  |
| `named_form_fields` | ```Object``` |  Deprecated. Use `form_fields` inside the [documents](https://developers.hellosign.com/api/reference/operation/templateGet/#!c&#x3D;200&amp;path&#x3D;template/documents&amp;t&#x3D;response) array instead.  |  |
| `reusable_form_id` | ```String``` |    |  |

