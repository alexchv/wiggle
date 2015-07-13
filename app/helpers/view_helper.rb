module ViewHelper

  def title(title)
    content_for(:page_title) { title.to_s }
  end

  def feature_landing(klasses, name, description)
    content_tag(:div, :class => 'col-md-4') do
      safe_join([content_tag(:div, '', :class => klasses), content_tag(:h2, name), content_tag(:p, description)])
    end
  end

  def sign_in_btn
    link_to(user_omniauth_authorize_path(:google_oauth2)) { button_tag("Sign in with Google", :class => 'login') }
  end

end
