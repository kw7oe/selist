module ApplicationHelper
  include UsersHelper

  # View Helper: Brand Related
  def platform_name
    "Flist"
  end

  def platform_description
    "Sync with your course, get more done"
  end

  # View Helper: Navigation Bar
  def should_display_about_and_features
    controller.controller_name == "static_pages"
  end

  def active_link_to(path, expected_action_name, li_text) 
    class_name = nil

    if controller.action_name == expected_action_name
      if controller.controller_name =~ /(users|teachers|students)/
        class_name = "active"
      end
    end

    link_to path do 
      content_tag(:li, li_text, class: class_name)
    end
  end

  # View Helper: Field
  def link_to_add_field(name, association)
    field = render(association.singularize + "_field")
    link_to name, "#", class: "add_fields", data: {field: field}
  end

  # Controller Helper: Error Handling
  def invalid_model(model_name)
    flash.alert = "Invalid #{model_name}"
    redirect_back(fallback_location: user_dashboard_path(current_user))
  end

  def authenticate_user
    if current_user.nil?
      redirect_to sign_in_path, notice: "Please sign in before proceed."
    end
  end

end
