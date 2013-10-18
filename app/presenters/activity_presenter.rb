class ActivityPresenter < SimpleDelegator
  attr_reader :activity

  def initialize(activity, view)
    super(view)
    @activity = activity
  end

  def render_activity
    div_for activity do
      content_tag(:td, style: "width: 175px") do
        link_to(activity.user.full_name, profile_path(activity.user)) + "<br>".html_safe +
        (l activity.created_at, format: :long)
      end +
      content_tag(:td) do
        if activity.trackable_type == "Employee"
          "<i class='icon-user'></i>".html_safe
        elsif activity.trackable_type == "Company"
          if activity.action == "create"
            "<i class='icon-plus'></i>".html_safe
          elsif activity.action == "update"
            "<i class='icon-edit'></i>".html_safe
          end
        # elsif activity.trackable_type == "Event"
        #   "<i class='icon-calendar'></i>".html_safe
        elsif activity.trackable_type == "Comment"
          "<i class='icon-comment'></i>".html_safe
        elsif activity.trackable_type == "Sale"
          "<i class='icon-barcode'></i>".html_safe
        end
      end +
      content_tag(:td) do
         render_partial
      end
    end
  end

  def render_partial
    locals = {activity: activity, presenter: self}
    locals[activity.trackable_type.underscore.to_sym] = activity.trackable
    render partial_path, locals
  end

  def partial_path
    "activities/#{activity.trackable_type.underscore}/#{activity.action}"
  end
end
