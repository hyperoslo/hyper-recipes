def user_attributes(overrides = {})
  {
    email: "user@example.com",
    password: "password",
    password_confirmation: "password"
  }.merge(overrides)
end

def recipe_attributes(overrides = {})
  {
    name: 'Fresh Peach Cobbler I',
    difficulty: 1,
    instructions: "Peaches!!",
    favorite: true,
    remote_photo_url: 'http://4.bp.blogspot.com/-qEDAjrCdmJk/TjrFmh_rMOI/AAAAAAAAA0g/ydwQKoXaD7c/s1600/PeachCobbler.jpg',
    description: 'Best dessert in planet earth!',
    user_id: 1
  }.merge(overrides)
end