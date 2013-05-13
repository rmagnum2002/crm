function fill_form() {
  var select = $("select#state_id_0").val();
  $("#company_addresses_attributes_1_country_id").val($("#company_addresses_attributes_0_country_id").val());
  $('select#state_id_1').html($('select#state_id_0').html()).attr('class', 'state_id_1');
  $('select#state_id_1').val(select);
  $("#company_addresses_attributes_1_postal_code").val( $("#company_addresses_attributes_0_postal_code").val() );
  $("#company_addresses_attributes_1_street").val( $("#company_addresses_attributes_0_street").val() );
  $("#company_addresses_attributes_1_street_number").val( $("#company_addresses_attributes_0_street_number").val() );
}
