class User < ActiveRecord::Base
  has_many :orders
  has_many :requests

  has_secure_password
end
