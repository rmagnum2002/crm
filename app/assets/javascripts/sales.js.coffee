jQuery ->
  Morris.Line
    element: 'sales_chart'
    data: $('#sales_chart').data('sales')
    xkey: 'created_at'
    ykeys: ['ammount']
    labels: ['Ammount']
