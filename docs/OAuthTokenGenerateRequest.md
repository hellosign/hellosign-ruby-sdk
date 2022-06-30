# HelloSign::OAuthTokenGenerateRequest



## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| `client_id`<sup>*_required_</sup> | ```String``` |  The client id of the app requesting authorization.  |  |
| `client_secret`<sup>*_required_</sup> | ```String``` |  The secret token of your app.  |  |
| `code`<sup>*_required_</sup> | ```String``` |  The code passed to your callback when the user granted access.  |  |
| `grant_type`<sup>*_required_</sup> | ```String``` |  When generating a new token use `authorization_code`.  |  [default to 'authorization_code'] |
| `state`<sup>*_required_</sup> | ```String``` |  Same as the state you specified earlier.  |  |

