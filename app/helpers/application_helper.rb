module ApplicationHelper
  def body_class(body_wrapper = '')
    if body_wrapper.blank?
      'skin-blue sidebar-mini wysihtml5-supported'
    else
      body_wrapper
    end
  end
end
