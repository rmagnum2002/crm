module EmployeesHelper

  def job_title(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :job_title_id, JobTitle.find(:all), :id, lang, :include_blank => t(:"employee.form.select_job")
  end

  def gender(f)
    if current_language == 'ro'
      gender = :name_ro
    elsif current_language == 'ru'
      gender = :name_ru
    else
      gender = :name
    end
    f.collection_select :gender_id, Gender.all, :id, gender, :include_blank => t(:"employee.form.select_gender")
  end

  def language(f)
    if current_language == 'ro'
      language = :name_ro
    elsif current_language == 'ru'
      language = :name_ru
    else
      language = :name
    end
    f.collection_select :language_id, Language.all, :id, language, :include_blank => t(:"employee.form.select_language")
  end

  def dt_job_title(employee)
    if current_language == 'ro'
      employee.job_title.name_ro
    elsif current_language == 'ru'
      employee.job_title.name_ru
    else
      employee.job_title.name
    end
  end

  def dt_language(employee)
    if current_language == 'ro'
      employee.language.name_ro
    elsif current_language == 'ru'
      employee.language.name_ru
    else
      employee.language.name
    end
  end

  def dt_gender(employee)
    if current_language == 'ro'
      employee.gender.name_ro
    elsif current_language == 'ru'
      employee.gender.name_ru
    else
      employee.gender.name
    end
  end
end
