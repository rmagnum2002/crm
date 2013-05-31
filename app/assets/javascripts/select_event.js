// function selectBoxValue(value) {
//   $("#select_event").change(function() {
//     var value = $("#select_event").val();
//     if (value == 0)
//     {
//       $("#email_field").attr("type", "hidden");
//       $("#date_field").attr("type", "hidden");
//       $("#select_field").attr("style", "display:none");
//     }
//     else if (value == 1)
//     {
//       $("#date_field").attr("type", "text");
//       $("#email_field").attr("type", "hidden");
//       $("#select_field").attr("style", "display:none");
//     }
//     else if (value == 2)
//     {
//       $("#email_field").attr("type", "text");
//       $("#date_field").attr("type", "hidden");
//       $("#select_field").attr("style", "display:none");
//     }
//     else if (value == 3 || value == 4 || value == 5 || value == 6)
//     {
//       $("#date_field").attr("type", "text");
//       $("#email_field").attr("type", "hidden");
//       $("#select_field").attr("style", "display:inline");
//     }
//     console.log($("#select_event").val());
//   });
// }
function selectBoxValue(object) {
  var select = object
  var value = object.val();
  alert(value);
  if (value == 2)
  {
    $(select).next('.email_field').attr("type", "text");
    $(select).next().next('.contact_field').attr("style", "display:none;");
    $(select).next().next().next('.date_field').attr("type", "hidden");
  }
  if (value == 3)
  {
    $(select).next('.email_field').attr("type", "hidden");
    $(select).next().next('.contact_field').attr("style", "display:inline;");
    $(select).next().next().next('.date_field').attr("type", "hidden");
  }
}
