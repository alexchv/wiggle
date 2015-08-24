class AnimatedElementsController < LoggedUserController

  def animate
    puts '====='
    puts @user = User.where({:api_key => params[:q]}).first
    puts '====='
  rescue => e


  end

end
