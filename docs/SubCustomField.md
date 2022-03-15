# HelloSign::SubCustomField

An array defining values and options for custom fields. Required when defining pre-set values in `form_fields_per_document` or [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro).

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `name`<sup>*_required_</sup> | ```String``` |  The name, or &quot;Field Label,&quot; of the custom field (the field&#39;s API ID can be used here as well).  |  |
| `editor` | ```String``` |  The RoleName allowed to edit the custom field (optional, but required if `required &#x3D; true`).<br><br>**Note**: Editable `custom_fields` are only supported for single signer requests or the first signer of ordered signature requests. If more than one signer is assigned to the unordered signature request, any editor value is ignored and the field will not be editable.  |  |
| `required` | ```Boolean``` |  A boolean describing if this field is required  |  [default to false] |
| `value` | ```String``` |  The value of the custom field  |  |

