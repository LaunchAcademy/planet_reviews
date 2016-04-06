class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :planets
  has_many :reviews

  class << self
    def admin
      return find_admin if find_admin
      return create_admin
    end

    private
    def find_admin
      find_by(email: admin_email)
    end

    def create_admin
      user = new
      user.email = ENV["ADMIN_EMAIL"]
      user.password = ENV["ADMIN_PASSWORD"]
      user.save!
      user
    end
  end
end
