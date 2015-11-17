# For Hyper staff, not relevant for applicants

How to register an applicant to obtain an access token

## Register to get a token

* **email:string** (obligatory field, must be valid email format)
* **password** (obligatory field)
* **password_confirmation** (obligatory field)
* seed_recipes:boolean

### HTTP
`POST`: `/users`

Sample:

```json
{
  "user": {
    "email": "user@example.com",
    "password": "secret",
    "password_confirmation": "secret",
    "seed_recipes": true
  }
}
```
In Curl it would be something like that:
```
curl -d "user[email]=user@example.com" -d "user[password]=password" -d "user[password_confirmation]=password" -d "user[seed_recipes]=true" http://hyper-recipes.herokuapp.com/users
```

When you successfully create a user you'll get a token in the json response, pass that on to the applicant an inform him/her to use that in all communications with the API. They will need to set a request header with `Authorization` and use the generated auth_token.
