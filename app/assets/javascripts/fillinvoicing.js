  function FillInvoicing(f) {

    if(fill_invoicing.checked == true) {

      $("#company_addresses_attributes_1_country_id").val( $("#company_addresses_attributes_0_country_id").val());

      if($("#company_addresses_attributes_1_country_id").val().length > 0) {

        $("#company_addresses_attributes_1_state_id").val($("#company_addresses_attributes_0_state_id").val());

        $(".controls.state_1").css("display", "");

        // $(".controls.state_1").replaceWith($("#company_addresses_attributes_1_state_id"))
      }

      $("#company_addresses_attributes_1_postal_code").val( $("#company_addresses_attributes_0_postal_code").val() );

      $("#company_addresses_attributes_1_street").val( $("#company_addresses_attributes_0_street").val() );

      $("#company_addresses_attributes_1_street_number").val( $("#company_addresses_attributes_0_street_number").val() );
  }

}
