def url_of(page)
  case page
    when "login"
      return "/users/login"
    else
      throw "Page URL not found"
  end
end