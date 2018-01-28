class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def full_name
    if first_name.nil? && last_name.nil?
      email
    else
      if first_name.nil?
        last_name
      elsif last_name.nil?
        first_name
      else
        "#{first_name} #{last_name}"
      end
    end
  end
end
