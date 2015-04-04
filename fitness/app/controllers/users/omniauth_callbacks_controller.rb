class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def magento
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_magento_oauth(request.env["omniauth.auth"], current_user)

    if @user && @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "magento") if is_navigational_format?
    else
      session["devise.magento_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
