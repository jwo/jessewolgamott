 def lib_nav_active(route, current_path)
    text = route
    route = '/' if route == "home"
    "<li><a href=\"#{route}\"#{' class="active"' if route == current_path}>#{text}</a></li>"
  end