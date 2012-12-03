def url_of(page)
  case page
    when "home"
      return "/"
    when "passwords"
      return passwords_path()
    when "login"
      return "/users/login"
    else
      throw "Page URL not found"
  end
end