module ApplicationHelper
  def bootstrap_class_for(flash_type)
    map = {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys
    map[flash_type]
  end
  
  def flash_messages
    flash.each do |message_type, message|
      unless message_type.to_s == 'timedout'
        div = content_tag(:div, message, class: "alert #{bootstrap_class_for(message_type)}") do
          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          concat message
        end
      end
      concat div
    end
    nil
  end

end
