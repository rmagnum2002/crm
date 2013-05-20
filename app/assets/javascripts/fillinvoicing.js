function fill_form() {
	var select = $("select#state_id_0").val();
	$("#company_addresses_attributes_1_country_id").val($("#company_addresses_attributes_0_country_id").val());
		if ($('#state_id_1').length == 1) {
			$('select#state_id_1').html($('select#state_id_0').html()).attr('name', 'company[addresses_attributes][1][state_id]');
		}
		else {
			$("#state_id_0").clone().appendTo($('.controls.state_1')).attr('id', 'state_id_1').attr('name', 'company[addresses_attributes][1][state_id]');
		}
  $('select#state_id_1').val(select);
  $("#company_addresses_attributes_1_postal_code").val( $("#company_addresses_attributes_0_postal_code").val() );
  $("#company_addresses_attributes_1_street").val( $("#company_addresses_attributes_0_street").val() );
  $("#company_addresses_attributes_1_street_number").val( $("#company_addresses_attributes_0_street_number").val() );
}

var fnShowHide;

fnShowHide = function(iCol) {
  var bVis, oTable;
  oTable = $("#companies, #employees").dataTable();
  bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
  return oTable.fnSetColumnVis(iCol, (bVis ? false : true));
};
