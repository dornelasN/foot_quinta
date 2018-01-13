module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'SB Cuervos'
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

  def current_team
    @current_team = Team.find(params[:id])
  end
end
