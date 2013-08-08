class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_password_field = false
  end
  attr_accessible :title, :email, :first_name, :last_name, :phone, :password ,:password_confirmation, :is_active ,:openid_identifier
end
