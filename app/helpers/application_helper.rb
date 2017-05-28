module ApplicationHelper

  # View Helper: Brand Related
  def platform_name
    "Selist"
  end

  def platform_description
    "Sync with your course, get more done"
  end

  # View Helper: Navigation Bar
  def should_display_about_and_features
    controller.controller_name == "static_pages" || 
    controller.controller_name == "sessions" ||
    (controller.controller_name == "users" && controller.action_name == "new")
  end

  def active_link_to(path, expected_action_name, li_text) 
    class_name = nil

    if controller.action_name == expected_action_name
      class_name = "active"
    end

    link_to path do 
      content_tag(:li, li_text, class: class_name)
    end
  end

end
