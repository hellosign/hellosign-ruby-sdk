# HelloSign::TemplateAddUserRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | ```String``` |  The id of the Account to give access to the Template. &lt;b&gt;Note&lt;/b&gt; The account id prevails if email address is also provided.  |  |
| `email_address` | ```String``` |  The email address of the Account to give access to the Template. &lt;b&gt;Note&lt;/b&gt; The account id prevails if it is also provided.  |  |
| `skip_notification` | ```Boolean``` |  If set to `true`, the user does not receive an email notification when a template has been shared with them. Defaults to `false`.  |  [default to false] |

