module PermitsConcern
  extend ActiveSupport::Concern

  private

    def permitted_params
      {
          :website => website_params,
      }
    end

    def website_params
      params.fetch(:website, {}).permit(
          :url
      )
    end

end