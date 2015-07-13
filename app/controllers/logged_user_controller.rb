class LoggedUserController < InheritedResources::Base
  before_action :authenticate_user!
  load_and_authorize_resource

  include PermitsConcern

end
