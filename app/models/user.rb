class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:github]

  has_many :planets
  has_many :reviews

  class << self
    def admin
      return find_admin if find_admin
      return create_admin
    end

    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.image = auth.info.image
      end
    end

    private
    def find_admin
      find_by(email: admin_email)
    end

    def create_admin
      user = new
      user.email = admin_email
      user.password = admin_password
      user.save!
      user
    end

    def admin_email
      ENV["ADMIN_EMAIL"] || "definitelyreal@launchacademy.com"
    end

    def admin_password
      ENV["ADMIN_PASSWORD"] || "longenoughpassword"
    end
  end
end
