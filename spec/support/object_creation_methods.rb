def create_user(overrides = {})
    User.create!({
      first_name: "Audrey",
      last_name: "Hepburn",
      email: "audrey@hepburn.com",
      password: "password",
    }.merge(overrides))
end
