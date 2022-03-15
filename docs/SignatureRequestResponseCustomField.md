# HelloSign::SignatureRequestResponseCustomField

An array of Custom Field objects containing the name and type of each custom field.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name` | ```String``` |  The name of the Custom Field.  |  |
| `type` | ```String``` |  The type of this Custom Field. Only &#39;text&#39; and &#39;checkbox&#39; are currently supported.  |  |
| `value` | ```String``` |  A text string for text fields or true/false for checkbox fields  |  |
| `required` | ```Boolean``` |  A boolean value denoting if this field is required.  |  |
| `api_id` | ```String``` |  The unique ID for this field.  |  |
| `editor` | ```String``` |  The name of the Role that is able to edit this field.  |  |

