class Auth::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    authenticate_user if @user.persisted?
  end

  private

    def authenticate_user
      sign_in(:user, @user)
      # redirect_to @user.first_time ? wizard_index_path : dashboard_path
      redirect_to wizard_index_path
    end

end
