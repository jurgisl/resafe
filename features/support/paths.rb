def url_of(page)
  case page
    when "login"
      return "/login"
    else
      throw "Page URL not found"
  end
end