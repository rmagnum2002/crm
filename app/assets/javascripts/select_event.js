function selectBoxValue(object) {
  var select = object
  var value = object.val();
  // alert(value);
  var email_field = $(select).next('.email_field');
  var contact_field = $(select).next().next('.contact_field');
  var date_field = $(select).next().next().next('.date_field');
  if (value == 0)
  {
    email_field.attr("type", "hidden");
    contact_field.attr("style", "display:none;");
    date_field.attr("type", "hidden");
  }
  if (value == 2)
  {
    email_field.attr("type", "text");
    contact_field.attr("style", "display:none;");
    date_field.attr("type", "hidden");
  }
  if (value == 3)
  {
    email_field.attr("type", "hidden");
    contact_field.attr("style", "display:inline;");
    date_field.attr("type", "text");
  }
  if (value == 4 || value == 5 || value == 6)
  {
    email_field.attr("type", "hidden");
    contact_field.attr("style", "display:inline;");
    date_field.attr("type", "text");
  }
}
