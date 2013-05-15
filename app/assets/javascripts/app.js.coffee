jQuery ->
  $('#company_client_at, #employee_birthday, #employee_client_date').datepicker
    dateFormat: 'yy-mm-dd'
    # monthNames: ['Ianuarie','Februarie','Martie','Aprilie','Mai','Iunie', 'Iulie','August','Septembrie','Octombrie','Noiembrie','Decembrie'],

$ ->
  $(".pagination a").on "click", ->
    $.getScript @href
    false
