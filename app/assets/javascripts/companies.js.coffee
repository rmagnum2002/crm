# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#companies').dataTable
    sPaginationType: "full_numbers"
    sDom: "Rlfrtip"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#companies').data('source')
jQuery ->
  $('.best_in_place').best_in_place()
