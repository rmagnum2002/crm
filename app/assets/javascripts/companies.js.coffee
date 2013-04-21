# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  options =
    sPaginationType: "full_numbers"
    sDom: "RlfrtipT"
    bJQueryUI: true
    bDestroy: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#companies').data('source')
    oTableTools:
      sSwfPath: "http://localhost:3000/swf/copy_csv_xls_pdf.swf"

  Lang = $('#companies').data('language')
  if Lang == "ro"
    options.oLanguage =
      sProcessing:   "Procesare...",
      sLengthMenu:   "Afișează _MENU_ înregistrări pe pagină",
      sZeroRecords:  "Nu am gasit nimic - ne pare rău",
      sInfo:         "Afișate de la _START_ la _END_ din _TOTAL_ înregistrări",
      sInfoEmpty:    "Afișate de la 0 la 0 din 0 înregistrări",
      sInfoFiltered: "(filtrate dintr-un total de _MAX_ înregistrări)",
      sInfoPostFix:  "",
      sSearch:       "Caută:",
      sUrl:          "",
      oPaginate:
        sFirst:    "Prima",
        sPrevious: "Precedenta",
        sNext:     "Următoarea",
        sLast:     "Ultima"

  if Lang == "ru"
    options.oLanguage =
      sProcessing:   "Подождите...",
      sLengthMenu:   "Показать _MENU_ записей",
      sZeroRecords:  "Записи отсутствуют.",
      sInfo:         "Записи с _START_ до _END_ из _TOTAL_ записей",
      sInfoEmpty:    "Записи с 0 до 0 из 0 записей",
      sInfoFiltered: "(отфильтровано из _MAX_ записей)",
      sInfoPostFix:  "",
      sSearch:       "Поиск:",
      sUrl:          "",
      oPaginate:
        sFirst: "Первая",
        sPrevious: "Предыдущая",
        sNext: "Следующая",
        sLast: "Последняя"
      oAria:
          sSortAscending:  ": активировать для сортировки столбца по возрастанию",
          sSortDescending: ": активировать для сортировки столбцов по убыванию"

  $('#companies').dataTable(options)

jQuery ->
  $('.best_in_place').best_in_place()

jQuery ->
  $('#company_addresses_attributes_1_state_id').parent().hide()
  states = $('#company_addresses_attributes_1_state_id').html()
  console.log(states)
  $('#company_addresses_attributes_1_country_id').change ->
    country = $('#company_addresses_attributes_1_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label=#{escaped_country}]").html()
    console.log(options)
    if options
      $('#company_addresses_attributes_1_state_id').html(options)
      $('#company_addresses_attributes_1_state_id').parent().show()
    else
      $('#company_addresses_attributes_1_state_id').empty()
      $('#company_addresses_attributes_1_state_id').parent().hide()

jQuery ->
  $('#company_addresses_attributes_0_state_id').parent().hide()
  states = $('#company_addresses_attributes_0_state_id').html()
  console.log(states)
  $('#company_addresses_attributes_0_country_id').change ->
    country = $('#company_addresses_attributes_0_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label=#{escaped_country}]").html()
    console.log(options)
    if options
      $('#company_addresses_attributes_0_state_id').html(options)
      $('#company_addresses_attributes_0_state_id').parent().show()
    else
      $('#company_addresses_attributes_0_state_id').empty()
      $('#company_addresses_attributes_0_state_id').parent().hide()
