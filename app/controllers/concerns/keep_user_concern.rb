module KeepUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :keep_user, :if => :user_signed_in?

    protected

      def keep_user
        User.current_user = current_user
      end

  end

end