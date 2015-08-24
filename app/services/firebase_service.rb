class FirebaseService < Base::EventDispatcher

  class << self

    def event_manager(object, event)
      super

      case event
        when :create

          # add object to own tree
          object_name = object.class.to_s.underscore.pluralize
          set_object(object)

          object.class.reflect_on_all_associations(:belongs_to).each do |p|

            relation_name = p.name
            relation_object = object.send(relation_name) # if object.respond_to?(relation)

            FIREBASE_CLIENT.set("#{relation_name.to_s.pluralize}/#{relation_object.id}/#{object_name}/#{object.id}", true)

          end

        when :update

          set_object(object)

        when :destroy

      end

    end

    def set_object(object)
      object_name = object.class.to_s.underscore.pluralize
      object_path = "/#{object_name}/#{object.id}/"

      FIREBASE_CLIENT.set(object_path, object.attributes)
    end

  end

end
