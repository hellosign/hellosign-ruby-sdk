# HelloSign::TeamAddMemberRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `account_id` | ```String``` |  `account_id` or `email_address` is required. If both are provided, the account id prevails.<br><br>Account id of the user to invite to your Team.  |  |
| `email_address` | ```String``` |  `account_id` or `email_address` is required, If both are provided, the account id prevails.<br><br>Email address of the user to invite to your Team.  |  |
| `role` | ```String``` |  A role member will take in a new Team.<br><br>**Note**: This parameter is used only if `team_id` is provided.  |  |

