module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'RUNTEQ Q&A'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def flash_class_for(key)
    case key
      when 'success' then 'alert-success'
      when 'failed'   then 'alert-danger'
    end
  end
end
