def url_of(page)
  case page
    when "home"
      return "/"
    when "passwords"
      return passwords_path()
    when "login"
      return "/users/login"
    when "users administration"
      return "/admin/users"
    when "groups administration"
      return "/admin/groups"
    else
      throw "Page URL not found"
  end
end