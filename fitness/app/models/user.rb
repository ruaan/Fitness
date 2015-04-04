class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :accounts
  has_many :projects
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, :omniauth_providers => [:magento]

  def self.find_for_magento_oauth(auth, signed_in_resource=nil)
    # update logged in user
    if signed_in_resource
      user = signed_in_resource
      update_user_with_magento_data(auth, user)
      # create new user if user details are known (not available through Admin API)
    elsif authenticated_through_customer_api?(auth)
      user = User.find_by(email: auth.info.email)
      if user
        update_user_with_magento_data(auth, user)
      else
        create_user_with_magento_data(auth)
      end
      # log authentication details from Magento if user details are not known (not signed in and authenticated through Admin API)
    else
      puts "MAGENTO_TOKEN: #{magento_token}"
      puts "MAGENTO_SECRET: #{magento_secret}"
    end
    user || nil
  end

  private

  def self.authenticated_through_customer_api?(auth)
    auth.info.present?
  end

  def self.update_user_with_magento_data(auth, user)
    user.update!(
        magento_id: auth.try(:uid), # doesn't exist for Admin API
        magento_token: auth.credentials.token,
        magento_secret: auth.credentials.secret
    )
  end

  def self.create_user_with_magento_data(auth)
    user = User.create!(
        first_name: auth.info.first_name,
        last_name:  auth.info.last_name,
        magento_id: auth.uid,
        magento_token: auth.credentials.token,
        magento_secret: auth.credentials.secret,
        email:      auth.info.email,
        password:   Devise.friendly_token[0,20]
    )
  end
 
end
