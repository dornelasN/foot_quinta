module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Foot Quinta"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # display object errors
  def form_errors_for(object = nil)
    render('shared/form_errors', object: object) unless object.blank?
  end
end
