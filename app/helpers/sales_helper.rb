module SalesHelper
  # def sales_chart_data
  #   (2.weeks.ago.to_date..Date.today).map do |date|
  #     {
  #       created_at: date,
  #       ammount: Sale.where("date(created_at) = ?", date).sum(:ammount)
  #     }
  #   end
  # end

  def sales_chart_data(start = 2.weeks.ago)
    sales_by_day = Sale.total_grouped_by_day(start)
    (2.weeks.ago.to_date..Date.today).map do |date|
      {
        created_at: date,
        ammount: sales_by_day[date] || 0
      }
    end
  end
end
