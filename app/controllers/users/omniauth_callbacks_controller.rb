class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_action :authenticate_user!

  def all
    user = User.from_omniauth(env['omniauth.auth'], current_user)
    puts '---------------------------'
    puts user.inspect
    if user.persisted?
      sign_in_and_redirect(user)
      set_flash_message(:notice, :success, :kind => env['omniauth.auth']['provider']) if is_navigational_format?
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    # do something
    # then delegate to super.
    super
  end

  alias_method :facebook, :all
  alias_method :linkedin, :all
  # alias_method :passthru, :all
  alias_method :google_oauth2, :all
  # alias_method :twitter, :all
end
