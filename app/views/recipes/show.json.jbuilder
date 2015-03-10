json.id @recipe.id
json.name @recipe.name
json.description  @recipe.description
json.instructions @recipe.instructions
json.favorite @recipe.favorite
json.difficulty   @recipe.difficulty
json.created_at @recipe.created_at
json.updated_at @recipe.updated_at
json.photo do
  json.url @recipe.photo_url
  json.thumbnail @recipe.photo.thumbnail.url
end