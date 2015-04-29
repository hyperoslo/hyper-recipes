json.array! @recipes do |recipe|
  json.partial! 'recipe', recipe: recipe
end

