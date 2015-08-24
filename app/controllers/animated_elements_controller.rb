class AnimatedElementsController < LoggedUserController

  def animate
    @user = User.where({:api_key => params['q']}).first
  rescue => e
    puts e.message
  end

end
