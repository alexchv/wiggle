module PermitsConcern
  extend ActiveSupport::Concern

  private

    def permitted_params
      {
          :user      => user_params,
          :animation => animation_params,
          :website   => website_params
      }
    end

    def user_params
      params.fetch(:user, {}).permit(
           :website_url,
           :email,
           :first_name,
           :last_name
      )
    end

    def animation_params
      params.fetch(:animation, {}).permit(
          :element_tag,
          :element_id,
          :element_classes,
          :element_jq_selector,
          :name,
          :html_attribute,
          :delay,
          :duration,
          :count,
          :animation_type_id
      )
    end

    def website_params
      params.fetch(:website, {}).permit(
          :url
      )
    end

end