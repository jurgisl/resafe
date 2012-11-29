def url_of(page)
  case page
    when "login"
      return "/users/login"
    when "passwords"
      return "/passwords"
    else
      throw "Page URL not found"
  end
end