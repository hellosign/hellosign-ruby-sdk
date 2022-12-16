# HelloSign::TeamRemoveMemberRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | ```String``` |  **account_id** or **email_address** is required. If both are provided, the account id prevails.<br><br>Account id to remove from your Team.  |  |
| `email_address` | ```String``` |  **account_id** or **email_address** is required. If both are provided, the account id prevails.<br><br>Email address of the Account to remove from your Team.  |  |
| `new_owner_email_address` | ```String``` |  The email address of an Account on this Team to receive all documents, templates, and API apps (if applicable) from the removed Account. If not provided, and on an Enterprise plan, this data will remain with the removed Account.<br><br>**Note**: Only available for Enterprise plans.  |  |
| `new_team_id` | ```String``` |  Id of the new Team.  |  |
| `new_role` | ```String``` |  A new role member will take in a new Team.<br><br>**Note**: This parameter is used only if `new_team_id` is provided.  |  |

