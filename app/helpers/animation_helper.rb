module AnimationHelper

  def render_animations(animations)
    content_tag(:div, :class => 'animations') do
      if animations.any?
        render({:partial => 'animations/partials/animation', :collection => animations.order(:updated_at => :desc)}) <<
        paginate(animations)
      else
        'No animations yet'
      end
    end
  end

  def delete_button(animation)

    link_to(animation_path(animation), :remote => true, :method => :delete,
            :data => { :confirm => 'All associated animated elements will be removed. Are you sure you to delete this record?' }) do
      button_tag do
        safe_join([content_tag(:span, '', :class => 'glyphicon glyphicon-trash'), ' Delete'])
      end
    end
  end

end
