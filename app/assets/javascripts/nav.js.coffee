$ ->
  active = $("div.nav_active").attr("id")
  $("ul.nav li##{active}").addClass("active")
