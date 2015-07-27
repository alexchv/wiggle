module MenuHelper

  def controller_tab_associations(controller, tab)
    association = case controller
      when :animations
        'Play'
      when :websites
        'Visual'
    end
    association == tab
  end

  def active_menu_class(tab)
    controller_tab_associations(params[:controller].andand.to_sym, tab) ? 'active' : ''
  end

  def menu_item(name, path, options = {})
    default_options = {:class => ''}
    default_options.merge!(options)

    content_tag(:li, :class => [default_options[:class], active_menu_class(name)].join(' ')) do
      safe_join([link_to('', path), content_tag(:div, name, :class => 'custom-title')])
    end
  end

end
