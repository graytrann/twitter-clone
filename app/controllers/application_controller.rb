class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # before_action :redirect_to_username_form, if: -> { :user_signed_in? && current_user&.username.blank? }
  protected

  def after_sign_in_path_for(resource)
    if resource.username.blank?
      new_username_path
    else
      dashboard_path
    end
  end

  def redirect_to_username_form
    return if controller_name == "usernames"
    redirect_to new_username_path
  end
end
