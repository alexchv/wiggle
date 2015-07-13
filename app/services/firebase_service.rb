class FirebaseService < Base::EventDispatcher

  class << self

    def event_manager(object, event)
      super
      case event
        when :create
          FIREBASE_CLIENT.set("/#{object.class.to_s.underscore.pluralize}/#{object.id}/", object.attributes)
        when :update

        when :destroy

      end

    end

  end

end
