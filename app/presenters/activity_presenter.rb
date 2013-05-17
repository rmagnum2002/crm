class ActivityPresenter < SimpleDelegator
  attr_reader :activity

  def initialize(activity, view)
    super(view)
    @activity = activity
  end

  def render_activity
    div_for activity do
      content_tag(:div, class: activity.trackable_type.downcase) do
        content_tag(:span, class: "span3") do
          link_to(activity.user.full_name, profile_path(activity.user)) + "<br>".html_safe +
          (l activity.created_at, format: :long)
        end +
        content_tag(:span, class: "span6") do
           render_partial
        end
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
