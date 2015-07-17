class WizardController < LoggedUserController
  include Wicked::Wizard
  skip_load_and_authorize_resource

  layout 'wizard'

  steps :website, :snippet

  before_action :create_website_by_cookie, :only => [:show]

  def show
    jump_to(:snippet) if current_user.websites.andand.first.andand.persisted? and step == :website
    jump_to(:website) if current_user.websites.blank? and step == :snippet

    render_wizard
  end

  def update
    case step
      when :website
        @website = Website.new({:url => params['website']['url'], :user => current_user})
    end
    render_wizard @website
  end

  private

    def create_website_by_cookie
      @website = Website.create({:url => cookies[:wiggle_website], :user => current_user})
    end

end
