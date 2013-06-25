function get_states_0() {
  $.ajax({
    type: "POST",
    url: "country_select_legal",
    data: {
      country_id : $('.controls.country_0 #company_addresses').val(),
      state_id : $('#state_id_0').val()
    }
  });
}

function get_states_1() {
  $.ajax({
    type: "POST",
    url: "country_select_invoicing",
    data: {
      country_id : $('.controls.country_1 #company_addresses').val(),
      state_id : $('#state_id_1').val()
    }
  });
}

function fill_form() {
  var select = $("select#state_id_0").val();
  if ($(".controls.country_0 #company_addresses").val() != false) {
    $(".controls.country_1").empty();
    $(".controls.country_0 #company_addresses").clone().appendTo($(".controls.country_1"))
    .attr('id', 'company_addresses_attributes_1_country_id')
    .attr('name', 'company[addresses_attributes][1][country_id]').change(get_states_1);
    $("#company_addresses_attributes_1_country_id").val($(".controls.country_0 #company_addresses").val());
  }

  if ($('#company_addresses_attributes_0_postal_code').val() != false) {
    $(".controls.postal_code_1").empty();
    $("#company_addresses_attributes_0_postal_code").clone().appendTo($(".controls.postal_code_1"))
    .attr('id', 'company_addresses_attributes_1_postal_code')
    .attr('name', 'company[addresses_attributes][1][postal_code]');
  }
  if ($('#company_addresses_attributes_0_street').val() != false) {
    $(".controls.street_1").empty();
    $("#company_addresses_attributes_0_street").clone().appendTo($(".controls.street_1"))
    .attr('id', 'company_addresses_attributes_1_street')
    .attr('name', 'company[addresses_attributes][1][street]');
  }
  if ($('#company_addresses_attributes_0_street_number').val() != false) {
    $(".controls.street_number_1").empty();
    $("#company_addresses_attributes_0_street_number").clone().appendTo($(".controls.street_number_1"))
    .attr('id', 'company_addresses_attributes_1_street_number')
    .attr('name', 'company[addresses_attributes][1][street_number]');
  }
  if ($('#state_id_1').length == 1) {
    $('select#state_id_1').html($('select#state_id_0').html()).attr('name', 'company[addresses_attributes][1][state_id]');
  }
  else {
    $("#state_id_0").clone().appendTo($('.controls.state_1')).attr('id', 'state_id_1').attr('name', 'company[addresses_attributes][1][state_id]');
  }
  $('select#state_id_1').val(select);
  $("#company_addresses_attributes_1_postal_code").val($("#company_addresses_attributes_0_postal_code").val());
  $("#company_addresses_attributes_1_street").val($("#company_addresses_attributes_0_street").val());
  $("#company_addresses_attributes_1_street_number").val($("#company_addresses_attributes_0_street_number").val());
}

var fnShowHide;

fnShowHide = function(iCol) {
  var bVis, oTable;
  oTable = $("#companies, #employees").dataTable();
  bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
  return oTable.fnSetColumnVis(iCol, (bVis ? false : true));
};
