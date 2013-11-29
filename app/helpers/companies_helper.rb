module CompaniesHelper

  def responsible_name(user)
    link_to user.full_name, profile_path(user)
  end

  def responsible_name_in_datatables(user)
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

    f.collection_select :company_source_id, @site.company_sources, :id, lang,
                        { :prompt => t(:'company.form.source') }, class: 'select required'
  end

  def client_category(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end

    f.collection_select :client_category_id, @site.client_categories, :id, lang,
                        { :prompt => t(:'company.form.client_category') }, class: 'select required'
  end

  def organizational_form(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :organizational_form_id, @site.organizational_forms, :id, lang,
                        { :prompt => t(:"company.form.organizational_form") }
  end

  def client_status(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :client_status_id, @site.client_statuses, :id, lang,
                        { :prompt => t(:'company.form.client_status') }, class: 'select required'
  end

  def client_type(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :client_type_id, @site.client_types, :id, lang,
                        { :prompt => t(:'company.form.client_type') }, class: 'select required'
  end

  def company_branch(f)
    if current_language == 'ro'
      lang = :name_ro
    elsif current_language == 'ru'
      lang = :name_ru
    else
      lang = :name
    end
    f.collection_select :company_branch_id, @site.company_branches, :id, lang,
                        { :prompt => t(:'company.form.branch') }, class: 'select required'
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

  def dt_organizational_form(company)
    if current_language == 'ro'
      company.organizational_form.name_ro
    elsif current_language == 'ru'
      company.organizational_form.name_ru
    else
      company.organizational_form.name
    end
  end

  def company_changes(version)
    version = version.changeset
  end

  def name_it(f, key)
    # TODO filter by site
    if f == 'company_branch_id'
      result = CompanyBranch.find key
      result_name(result)
    elsif f == 'company_source_id'
      result = CompanySource.find key
      result_name(result)
    elsif f == 'client_category_id'
      result = ClientCategory.find key
      result_name(result)
    elsif f == 'client_type_id'
      result = ClientType.find key
      result_name(result)
    elsif f == 'client_status_id'
      result = ClientStatus.find key
      result_name(result)
    elsif f == 'responsible_id'
      result = User.find key
      return result.full_name
    elsif f == 'organizational_form_id'
      result = OrganizationalForm.find key
      result_name(result)
    elsif f == 'marked_to_remove'
      marked_to_remove(key)
    elsif f == 'updated_at'
      return l key, format: :long
    elsif f == 'client_type_id'
      result = ClientType.find key
      result_name(result)
    else f == 'client_at'
      return key
    end
  end

  def result_name(result)
    if current_language == 'en'
      return result.name
    elsif current_language == 'ro'
      return result.name_ro
    else
      return result.name_ru
    end
  end

  def marked_to_remove(key)
    t(key ? :to_delete : :to_not_delete)
  end

  def show_country(address)
    if current_language == 'ro'
      address.country.name_ro
    elsif current_language == 'ru'
      address.country.name_ru
    else
      address.country.name
    end
  end

  def show_state(address)
    if current_language == 'ro'
      address.state.name_ro
    elsif current_language == 'ru'
      address.state.name_ru
    else
      address.state.name
    end
  end
end
