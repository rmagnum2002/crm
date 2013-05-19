module CompaniesHelper

  def responsible_name(user_id)
    user = User.find(user_id)
    link_to user.full_name, profile_path(user)
  end

  def responsible_name_in_datatables(user_id)
    user = User.find(user_id)
    link_to user.full_name, url_helpers.profile_path(user)
  end

  def company_source(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :company_source_id, CompanySource.find(:all), :id, lang, :prompt => t(:"company.form.source"), class: 'select_field'
  end

  def client_category(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :client_category_id, ClientCategory.find(:all), :id, lang, :prompt => t(:"company.form.client_category"), class: 'select_field'
  end

  def organizational_form(f)
    if current_language == 'ro'
      lang = :organizational_form_ro
    elsif current_language == 'ru'
      lang = :organizational_form_ru
    else
      lang = :organizational_form
    end
    f.collection_select :organizational_form_id, OrganizationalForm.find(:all), :id, lang, :prompt => t(:"company.form.organizational_form"), class: 'select_field'
  end

  def client_status(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :client_status_id, ClientStatus.find(:all), :id, lang, :prompt => t(:"company.form.client_status"), class: 'select_field'
  end

  def client_type(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :client_type_id, ClientType.all, :id, lang, :prompt => t(:"company.form.client_type"), class: 'select_field'
  end

  def company_branch(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :company_branch_id, CompanyBranch.find(:all), :id, lang, :prompt => t(:"company.form.branch"), class: 'select_field'
  end

  def dt_client_type(company)
    if current_language == 'ro'
      company.client_type.name_ro
    elsif current_language == 'ru'
      company.client_type.name_ru
    else
      company.client_type.name
    end
  end

  def dt_client_category(company)
    if current_language == 'ro'
      company.client_category.name_ro
    elsif current_language == 'ru'
      company.client_category.name_ru
    else
      company.client_category.name
    end
  end

  def dt_company_source(company)
    if current_language == 'ro'
      company.company_source.name_ro
    elsif current_language == 'ru'
      company.company_source.name_ru
    else
      company.company_source.name
    end
  end

  def dt_company_branch(company)
    if current_language == 'ro'
      company.company_branch.name_ro
    elsif current_language == 'ru'
      company.company_branch.name_ru
    else
      company.company_branch.name
    end
  end
end
