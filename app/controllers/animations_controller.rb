class AnimationsController < LoggedUserController


  def frame_modal
    element = AnimatedElement.find_by_html(params['el_tag'], params['el_id'], params['el_classes'])
    @animation =  element.present? ? element.animation : Animation.new
    render({:partial => 'animations/partials/form_modal', :locals => {:animation => @animation}, :layout => false})
  end

  private

    def collection
      @animations = @animations.page(params[:page])
    end

end
