class LandingController < ApplicationController

  layout 'landing'

  before_action :authenticated_user?

  def index
  end

  private

    def authenticated_user?
      redirect_to current_user.wizard_complete? ? animations_path : wizard_index_path if user_signed_in?
    end

end
