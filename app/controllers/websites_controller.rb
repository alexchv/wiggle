class WebsitesController < LoggedUserController

  def experiment
    redirect_to(website_path(@website, :web_url => params[:website][:web_url]))
  end

end
