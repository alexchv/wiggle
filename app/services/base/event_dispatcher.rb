class Base::EventDispatcher

  class << self

    def event_manager(object, event)
      event_code = "#{event.to_s}_#{object.class.name.underscore.gsub('/', '_')}"
      # send(event_code, *[object]) if respond_to?(event_code)
    end

  end

end