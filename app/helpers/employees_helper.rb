module EmployeesHelper

  def job_title(f)
    if current_language == 'ro'
      lang = :job_title_ro
    elsif current_language == 'ru'
      lang = :job_title_ru
    else
      lang = :job_title
    end
    f.collection_select :job_title_id, JobTitle.find(:all), :id, lang, :include_blank => t(:"employee.form.select_job")
  end

  def dt_job_title(employee)
    if current_language == 'ro'
      employee.job_title.job_title_ro
    elsif current_language == 'ru'
      employee.job_title.job_title_ru
    else
      employee.job_title.job_title
    end
  end

end
