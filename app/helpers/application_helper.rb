module ApplicationHelper
  def lang_links
    LOCALES.keys.sort.map { |k| link_to_if(@locale != k, k, set_locale_path(:lang => k,
                                                                            :back => request.fullpath)) }.join " | "
  end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def site_countries
    current_site_countries ||= current_site.countries
  end

  def i18n_name_field
    case current_language
      when 'ro'
        :name_ro
      when 'ru'
        :name_ru
      else
        :name
    end
  end
end
