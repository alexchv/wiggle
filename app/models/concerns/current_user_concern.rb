module CurrentUserConcern

  extend ActiveSupport::Concern

  included do

    class << self

      # thread-safe getter (as implemented in https://github.com/stffn/declarative_authorization)
      def current
        Thread.current[:current_user]
      end
      alias :current_user :current

      # thread-safe setter (as implemented in https://github.com/stffn/declarative_authorization)
      def current=(user)
        Thread.current[:current_user] = user
      end
      alias :current_user= :current=

    end

  end

end