module Firebasable
  extend ActiveSupport::Concern

  included do

    after_create  { FirebaseService.event_manager(self, :create)  }
    after_update  { FirebaseService.event_manager(self, :update)  }
    after_destroy { FirebaseService.event_manager(self, :destroy) }

  end

end
