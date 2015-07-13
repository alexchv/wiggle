module AuthConcern
  extend ActiveSupport::Concern

  included do
    skip_before_filter :verify_authenticity_token
    before_action :authenticate_user!
  end

end