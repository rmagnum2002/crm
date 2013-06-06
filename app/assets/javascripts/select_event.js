function selectBoxValue(object) {
  var select = object
  var value = object.val();
  // alert(value);
  var email_field = $(select).closest('.item').find('.email_field');
  var contact_field = $(select).closest('.item').find('.contact_field');
  var date_field = $(select).closest('.item').find('.date_field');
  if (value == 0)
  {
    email_field.attr("type", "hidden").removeAttr("required");
    contact_field.attr("style", "display:none;").removeAttr("required");
    date_field.attr("type", "hidden").removeAttr("required");
  }
  if (value == 2)
  {
    email_field.attr("type", "text").attr("required", "required");
    contact_field.attr("style", "display:none;").removeAttr("required");
    date_field.attr("type", "hidden").removeAttr("required");
  }
  if (value == 3)
  {
    email_field.attr("type", "hidden").removeAttr("required");
    contact_field.attr("style", "display:inline;")
    date_field.attr("type", "text").attr("required", "required");
  }
  if (value == 4 || value == 5 || value == 6)
  {
    email_field.attr("type", "hidden").removeAttr("required");
    contact_field.attr("style", "display:inline;")
    date_field.attr("type", "text").attr("required", "required");
  }
}
