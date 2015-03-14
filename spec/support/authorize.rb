def auth(user)
  @request.env["HTTP_AUTHORIZATION"] = "Token token=#{user.auth_token}"
end