require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :password

  before_save :encrypt_password
  def encrypt_password
    self.encrypted_password = encrypt(self.password)
  end

  def encrypt(password)
    Digest::SHA2.hexdigest(password)
  end
end
