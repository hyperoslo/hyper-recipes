# Introduction

This is the backend for the Hyper Recipes app, to be able to use it, you will need an access token that your contact inside Hyper will provide you with when you begin your quest. This is helpful so other applicants don't modify your recipes in any way.

The base HTTP endpoints is: `http://hyper-recipes.herokuapp.com`


## Retrieve recipes

`GET`: `/recipes`

Sample:

```json
[
  {
    "id": 437,
    "name": "Strawberries and Cream Cake",
    "description": "Makes an elegant presentation without too much fuss.",
    "instructions": "eee",
    "favorite": false,
    "difficulty": 3,
    "created_at": "2014-09-29T10:43:00.072Z",
    "updated_at": "2014-11-26T11:53:58.451Z",
    "photo": {
      "url": "https://hyper-recipes.s3.amazonaws.com/uploads/recipe/photo/437/Strawberries_and_Cream_Cake.jpg",
      "thumbnail_url": "https://hyper-recipes.s3.amazonaws.com/uploads/recipe/photo/437/thumbnail_Strawberries_and_Cream_Cake.jpg"
    }
  }
]
```
In Curl it would be something like that:
```
curl -H 'Authorization: Token token="replace-with-token"' http://hyper-recipes.herokuapp.com/recipes
```

## Create recipes

`POST`: `/recipes`

* **name:string** (obligatory field)
* **difficulty:integer** (obligatory field) [Valid values: 1, 2 and 3]
* description:text
* instructions:text
* favorite:boolean
* recipe[photo]:image == Multipart form request

Sample:

```json
{
  "recipe": {
    "name": "New name",
    "difficulty": 1
  }
}
```
In Curl it would be something like that:
```
curl -H 'Authorization: Token token="2e3e72bbbcfd13eb27f4"' -d "recipe[name]=Meatballs" -d "recipe[difficulty]=1" http://hyper-recipes.herokuapp.com/recipes
```

## Update recipes

`PUT` or `PATCH`: `/recipes/:id`

* **name:string** (obligatory field)
* **difficulty:integer** (obligatory field) [Valid values: 1, 2 and 3]
* description:text
* instructions:text
* favorite:boolean
* recipe[photo]:image == Multipart form request

Sample:

```json
{
  "recipe": {
    "name": "New name",
    "difficulty": 1
  }
}
```
In Curl it would be something like that:
```
curl -H 'Authorization: Token token="0b71145b7474d575632b"' -d "recipe[name]=Meatballzz" -d "recipe[difficulty]=2" -X PUT http://hyper-recipes.herokuapp.com/recipes/22
```


## Delete recipes

`DELETE`: `/recipes/:id`
In Curl it would be something like that:
```
curl -H 'Authorization: Token token="0b71145b7474d575632b"' -X DELETE http://hyper-recipes.herokuapp.com/recipes/22
```
