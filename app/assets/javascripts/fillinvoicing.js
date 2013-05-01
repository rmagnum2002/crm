$(document).ready(function(){

if($("#company_addresses_attributes_1_country_id").val().length > 0) {

    $(".controls.state_0").css("display", "");
    $(".controls.state_1").css("display", "");

    $(".controls.state_0 option[value='']").each(function() {
      $(this).remove();
    });

    $(".controls.state_1 option[value='']").each(function() {
      $(this).remove();
    });

    $(".controls.state_0 optgroup").toggle();

    $(".controls.state_1 optgroup").toggle();

}

})

function FillInvoicing() {

  if(fill_invoicing.checked == true) {

    $("#company_addresses_attributes_1_country_id").val( $("#company_addresses_attributes_0_country_id").val());

    if($("#company_addresses_attributes_1_country_id").val().length > 0) {

      $("#company_addresses_attributes_1_state_id").val($("#company_addresses_attributes_0_state_id").val());

      $(".controls.state_1").css("display", "");

      $(".controls.state_1 option[value='']").each(function() {
        $(this).remove();
      });

      $(".controls.state_1 optgroup").toggle();

    }

    $("#company_addresses_attributes_1_postal_code").val( $("#company_addresses_attributes_0_postal_code").val() );

    $("#company_addresses_attributes_1_street").val( $("#company_addresses_attributes_0_street").val() );

    $("#company_addresses_attributes_1_street_number").val( $("#company_addresses_attributes_0_street_number").val() );
  }

}
