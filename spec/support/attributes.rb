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

def user_params_valid
  {
    user: {
      email: 'user@example.com',
      password: 'testpass',
      password_confirmation: 'testpass'
    }
  }
end

def user_params_email
  {
    user: {
      email: 'user@example.com'
    }
  }
end

def user_params_email_invalid
  {
    user: {
      email: 'user@example',
      password: 'testpass',
      password_confirmation: 'testpass'
    }
  }
end

def user_params_password
  {
    user: {
      password: 'testpass',
      password_confirmation: 'testpass'
    }
  }
end

def recipe_params(overrides = {})
  {
    recipe: {
      name: 'Fresh Peach Cobbler I',
      difficulty: 1,
      user_id: 1
    }
  }.merge(overrides)
end
