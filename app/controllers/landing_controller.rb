class LandingController < ApplicationController

  layout 'landing'

  def index
  end

  def preview
    render({:nothing => true})
  end

end
