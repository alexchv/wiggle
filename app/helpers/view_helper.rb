module ViewHelper

  def title(title)
    content_for(:page_title) { title.to_s }
  end

  def feature_landing(klasses, name, description)
    content_tag(:div, :class => 'col-md-4') do
      safe_join([content_tag(:div, '', :class => klasses), content_tag(:h2, name), content_tag(:p, description)])
    end
  end

  def button_with_link(label, path, options = {})
    default_options = {:method => :post, :class => ''}
    default_options.merge!(options)

    link_to(path) { button_tag(label, :method => default_options[:method], :class => default_options[:class]) }
  end

end
