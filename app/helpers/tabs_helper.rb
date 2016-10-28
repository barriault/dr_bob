module TabsHelper
  def tab(label, path, icon, klass = nil)
    content_tag(:li, class: klass) do
      link_to(path) do
        content_tag(:span, nil, class: "#{icon}",  aria: { hidden: "true" }) + " #{label}"
      end
    end
  end
  
  def active_tab(label, path, icon)
    tab(label, path, icon, "active")
  end
  
  def disabled_tab(label, icon)
    tab(label, '#', icon, "disabled")
  end
end