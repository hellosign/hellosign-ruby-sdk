# HelloSign::SubFormFieldsPerDocumentRadio

This class extends `SubFormFieldsPerDocumentBase`.

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `type`<sup>*_required_</sup> | ```String``` |  An input field for radios. Use the `SubFormFieldsPerDocumentRadio` class.  |  [default to 'radio'] |
| `group`<sup>*_required_</sup> | ```String``` |  String referencing group defined in `form_field_groups` parameter.  |  |
| `is_checked`<sup>*_required_</sup> | ```Boolean``` |  `true` for checking the radio field by default, otherwise `false`. Only one radio field per group can be `true`.  |  |

