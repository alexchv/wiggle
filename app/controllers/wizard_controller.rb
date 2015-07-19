class WizardController < LoggedUserController
  include Wicked::Wizard
  skip_load_and_authorize_resource

  layout 'wizard'

  steps :website, :snippet

  before_action :wizard_complete?, :only => [:show]

  before_action :create_website_by_cookie, :only => [:show]

  after_action :complete_wizard, :only => [:finish_wizard]

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

  def finish_wizard
    redirect_to(animations_path)
  end

  private

    def wizard_complete?
      redirect_to(animations_path) if current_user.wizard_complete?
    end

    def create_website_by_cookie
      if step == :website
        @website = Website.create({:url => cookies[:wiggle_website] || '', :user => current_user})
        cookies.delete(:wiggle_website)
      end
    end

    def complete_wizard
      current_user.update_column(:wizard_complete, true)
    end

end
