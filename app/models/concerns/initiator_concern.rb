module InitiatorConcern

  extend ActiveSupport::Concern

  included do

    belongs_to :initiator, :class_name => 'User', :foreign_key => :initiator_id

    before_validation :keep_initiator

  end

  def keep_initiator
    self.initiator ||= User.current_user
  end

end