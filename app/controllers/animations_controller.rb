class AnimationsController < LoggedUserController

  private

    def collection
      @animations = @animations.page(params[:page])
    end

end
