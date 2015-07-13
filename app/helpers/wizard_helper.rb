module WizardHelper

  def website_errors
    return unless @website.andand.errors.andand.any?
    messages = []
    @website.errors.full_messages.each { |error| messages << { :message => [error + '.', 'Make sure you added a protocol (e.g. https://website.com).'].join(' ') , :type => :danger }}
    messages.to_json
  end

end
