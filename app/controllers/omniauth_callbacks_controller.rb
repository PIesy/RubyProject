class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    check_if_persisted('Facebook')
  end

  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"])

    check_if_persisted('Twitter')
  end

  def vkontakte
    @user = User.find_for_vkontakte_oauth(request.env["omniauth.auth"])

    check_if_persisted('Vkontakte')
  end

  private

  def check_if_persisted(provider)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => provider) if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end
end

